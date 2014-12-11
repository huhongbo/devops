### 简介

  Systemd 是 Linux 下的一款系统和服务管理器，兼容 SysV 和 LSB 的启动脚本。systemd 的特性有：支持并行化任务；同时采用 socket 式与 D-Bus 总线式激活服务；按需启动守护进程（daemon）；利用 Linux 的 cgroups 监视进程；支持快照和系统恢复；维护挂载点和自动挂载点；各服务间基于依赖关系进行精密控制。


### Systemd 基本工具

检视和控制systemd的主要命令是systemctl。该命令可用于查看系统状态和管理系统及服务。

### 分析系统状态

```
#输出激活的单元, 如:
$ systemctl
$ systemctl list-units

#输出运行失败的单元
$ systemctl --failed

#所有可用的单元文件存放在 /usr/lib/systemd/system/ 和 /etc/systemd/system/ 目录(后者优先级更高)。查看所有已安装服务
$ systemctl list-unit-files
```

### 使用单元

一个单元配置文件可以描述如下内容之一：系统服务（.service）、挂载点（.mount）、sockets（.sockets） 、系统设备（.device）、交换分区（.swap）、文件路径（.path）、启动目标（.target）、由 systemd 管理的计时器（.timer）。详情参阅 man 5 systemd.unit。
使用 systemctl 控制单元时，通常需要使用单元文件的全名，包括扩展名（例如 sshd.service）。但是有些单元可以在systemctl中使用简写方式。

- 如果无扩展名，systemctl 默认把扩展名当作 .service。例如 netcfg 和 netcfg.service 是等价的
- 挂载点会自动转化为相应的 .mount 单元。例如 /home 等价于 home.mount
- 设备会自动转化为相应的 .device 单元，所以 /dev/sda2 等价于 dev-sda2.device

```
立即激活单元：
# systemctl start <unit file>

立即停止单元：
# systemctl stop <unit file>

重启单元：
# systemctl restart <unit file>

重新加载配置：
# systemctl reload <unit file>

输出单元运行状态：
$ systemctl status <unit file>

检查单元是否配置为自动启动：
$ systemctl is-enabled <unit file>

开机自动激活单元：
# systemctl enable <unit file>

取消开机自动激活单元：
# systemctl disable <unit file>

显示单元的手册页（必须由单元文件提供）
# systemctl help <unit file>

重新载入 systemd，扫描新的或有变动的单元：
# systemctl daemon-reload
```



 #### 持续更新 。。。
