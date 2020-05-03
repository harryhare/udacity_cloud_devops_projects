### 任务和计划

平均两个小时一个小任务，14 小时，预计明晚 0点前做完

[x] 建 repo
[x] 找到ngixn/ 或者自己完成docker
[x] lint
[x] yml 文件编写
[x] aws cloudformation ec2 
[x] 手建jenkins
[x] ake  本地环境，ake deploy 
[x] jenkins ci(lint) 要求截图
[x] jeinkins cd
[x] kubenete rolling

### Jenkins

* jenkins 和 github 连接

  - 通过 blue ocean -> new pipeline
  - 会提示输入 personal access tokens，此时如果随便创建一个填进去会报错说一定要有`repo`和`user:email` 两个权限才行

* jenkinsfile

  https://www.jenkins.io/doc/pipeline/tour/getting-started

### docker 的安全扫描

aqua
- 使用
	- 序列号获得：https://microscanner.aquasec.com/signup
	- 邮件收到的 序列号要很久才能显示出来
	- plugin aqua microscaner， 直接在配置中输入序列号即可
	- 不同标准下 security 的级别不同
	- 结果， 点击 blue ocean 上方的 artifact，然后点击 html
		- 如果Jenkinsfile 中的格式写的是 html，则会有html文件，点击打开网页，找到红色的严重的警告，然后点击包名->libtasn1-6 in the Package Tracking System
		- 如果是 json，那么会有 json 文件，也能看到相应的信息
- 解决
	- 搜索结果中（https://www.debian.org/releases/）
		- sid 是 still in develop
		- jessie 是 debian 8
		- stretch 是 debian 9
		- buster 是 debian 10
	- 这些页面都可以找到 到相应deb 包的下载链接
		- 比如 https://packages.debian.org/search?searchon=sourcenames&keywords=libtasn1-6
	- 对于遇到的严重的安全问题，去搜索响应的package，安装替换即可，安装前可能要先purge
	- apt
		- apt show xxx （查看某个可用包的信息）
		- apt install xxx=version （指定安装包的版本，这个版本就是上面的命令的结果的版本，完全复制就可以，包括标点）
	- 替换到libtasn1-6=4.16.0-2 后也就是已经其实并没有解决，更换后依然报错，最后只好 apt purge 删掉
		- apt purge -y --allow-remove-essential libtasn1-6
	- 相关命令
		```
		wget https://get.aquasec.com/microscanner .
		chmod +x wget
		 docker run -it --rm -v /home/ubuntu:/mnt/ nginx /bin/bash
		./microscanner  xxx  --no-verify
		./microscanner  xxx  --html --no-verify
		```

### aws eks

* cloudformation 文档
  https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/AWS_EKS.html

* 从 aws 页面手动创建eks 
  https://docs.aws.amazon.com/eks/latest/userguide/getting-started-console.html

* 错误排查
  https://amazonaws-china.com/cn/premiumsupport/knowledge-center/eks-pod-status-troubleshooting/
  * kubectl describe pod xxx
	查看是否是资源不够/或者docker pull没权限
  * kubectl logs xxx 
    kubectl logs --previous YOUR-POD_NAME （先前崩溃的pod）
	查看docker 的日志
  * kubernetes client 和 server 版本不兼容
    kubectl version --short
  * 具体作这个project 时遇到的是第一个问题，也就是 node 是 micro 型的，资源不够，导致 pod pending，换成 medium 的机器就解决了

* aws 用户权限和 kubernete 用户权限
	* aws 当前用户位置 `~/.aws/credentials`
	  或者使用命令
		```bash
		aws sts get-caller-identity --profile root
		```
	* kubectl 的 和 context `~/.kube/config`
	  或者使用下面命令：
		```bash
		kubectl config view
		```
	* 当创建eks 的用户和 当前 ./aws/credentials 中已有的用户相同时，这样就可以
		```bash
		aws eks --profile root --region us-west-2  update-kubeconfig --name app-cluster
		```
		这个命令会在 ~/.kube/config 中增加相应的user，cluster ，context，并且将current-context 指向到这个context
		这时可以使用 `kubectl config view` 验证.
		如果要删除添加的信息，好像只能删context cluster `kubectl config -h`没有看到删user的命令
		```
		kubectl config  delete-context  arn:aws:eks:us-west-2:805839293099:cluster/test
		kubectl config  delete-cluster  arn:aws:eks:us-west-2:805839293099:cluster/test
		```
	* 否则可能需要先更改kubectl本身的 auth配置，具体没试过
		* https://stackoverflow.com/questions/50791303/kubectl-error-you-must-be-logged-in-to-the-server-unauthorized-when-accessing)
		* https://docs.aws.amazon.com/eks/latest/userguide/add-user-role.html
		* 主要命令
			```bash
			kubectl describe configmap  aws-auth -n kube-system
			kubectl edit configmap/aws-auth -n kube-system 
			```
			上条命令郁闷地方在于，执行kubectl本身是需要权限的，
			也就是如果需要先有权限才能给其他用户加权限，所以如果本身没有权限，那么就无解了
			然后更改 clusterrolebinding
			```
			kubectl create clusterrolebinding ops-user-cluster-admin-binding --clusterrole=cluster-admin --user=ops-user
			```


