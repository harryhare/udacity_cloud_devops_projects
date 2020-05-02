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

jenkins he github 连接通过 blue ocean -> new pipeline
- 会提示输入 personal access tokens，此时如果随便创建一个填进去会报错说一定要有`repo`和`user:email` 两个权限才行


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

### aws eks

* cloudformation 文档
https://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/AWS_EKS.html

* 从 aws 页面手动创建eks 
https://docs.aws.amazon.com/eks/latest/userguide/getting-started-console.html

* 错误排查
https://amazonaws-china.com/cn/premiumsupport/knowledge-center/eks-pod-status-troubleshooting/