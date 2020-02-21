### 构架图

- https://cloudcraft.co/ (可以显示aws 的具体 产品和价位， 3D 效果)

- https://www.lucidchart.com/ (通用的流程图工具，有两套aws 的 shapes 可选)


### cloudforamtion

#### cloudforamtion 常见的问题

- aws cli 报错，资源重名

  - 尽量不要把资源的名字写死

- create 卡住

  - 查看卡住的资源，有的资源的详情页面会给出报错信息
  
- update/delete 卡在删除资源时

  - update 的最后 delete 资源 似乎时异步的
  
  - delete 资源如果出错，会隔断时间重试，15-20min
  
  - 如果有在stack 资源上 创建的资源，则 从 stack 中删除该被依赖的资源时，会卡住
  
  - 也有时会莫名其妙的卡住，而且无法停止update，也无法rollback 
  
  - 这时可以直接在控制台上把 vpc 上的资源和vpn本身手动删除，然后等待 cloudforamtion 重试
  
  - cloudforamtion 在删除资源时，如果发现已删除，则过程会自动显示delete complete， 不会报错
  
  - cancel-update-stack 基本没用
  ```
   aws cancel-update-stack --stack-name xxx
  ```
  
  - IAM 相关的资源要加参数 `--capabilities CAPABILITY_IAM`
  
#### 网络

- 同一个 vpc 不同的子网本身就是通的，不需要额外的路由

- vpc 和 vpc 间可以通过 对等网络(peer connection)连接

- public subnet 和 private subnet 的区别是 前者拥有internet gateway

- nat gateway 和 internet gateway 本身都 要创建在 public subnet中

- nat gateway 可以不同子网公用一个，不过建议是一个子网一个

- 一定要把路由表建立好并 attach 后网络才会联通

- 一个简明清晰的例子：[AWS - 如何使用Cloudformation创建VPC](https://www.jianshu.com/p/5429744e9b59) 

#### security group

- icmp 的port 范围是 -1 ，-1

- 如果egress 不写， 默认是全开

#### eip 绑定 instance

- 不要用eip 的 instanceid 属性，不是想要的效果

- 要用 EIPAssociation 绑定

#### ELB

- 注意课上和作业中用的版本都是v2, 具体使用和v1 有很大的不同

- ELB 和 auto scaling group 的关联是， auto scaling group 有这个属性 
      TargetGroupARNs:
        - !Ref WebAppTargetGroup
		
#### bastion 和 key forward

- 如果仅仅需要 key forward， bastion 不需要额外的配置，工作中复杂的bastion登录时因为和 okta / ldap 集成

- key forword 只需要在ssh 客户端设置即可
	```bash
	eval `ssh-agent -s`
	ssh-add  test.pem 
	ssh-add -l
	ssh -A ubuntu@54.218.160.213
	```
- aws 文档中有说 `ssh-add -c test.pem` 但是，我尝试时报错
  `The user must confirm each use of the key`
 
- 如果 报错 `Could not open a connection to your authentication agent.`
   ```bash
   ssh-agent bash
   ```