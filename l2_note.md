### 构架图

- https://cloudcraft.co/ (可以显示aws 的具体 产品和价位， 3D 效果)

- https://www.lucidchart.com/ (通用的流程图工具，有两套aws 的 shapes 可选)


### cloudforamtion


#### 网络

- public subnet 和 private subnet 的区别是 前者拥有internet gateway

- nat gateway 和 internet gateway 本身都 要创建在 public subnet中

- nat gateway 可以不同子网公用一个，不过建议是一个子网一个

- 一定要把路由表建立好并 attach 后网络才会联通

#### security group

- icmp 的port 范围是 -1 ，-1

- 如果egress 不写， 默认是全开

#### ELB

- 注意课上和作业中用的版本都是v2

- ELB 和 auto scaling group 的关联是， auto scaling group 有这个属性 
      TargetGroupARNs:
        - !Ref WebAppTargetGroup