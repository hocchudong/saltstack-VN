saltstack-VN
============

Ghi chép về saltstack

Tài liệu tham khảo:

* http://vbyron.com/blog/infrastructure-management-saltstack-part-1-getting-started/
* http://eon01.com/blog/salt-stack-tutorial-for-beginners/
* https://www.digitalocean.com/community/tutorials/how-to-install-salt-on-ubuntu-12-04
* http://paulcodr.co/blog/2014/saltstack-intall-centos/


# Saltstack là gì !

- SaltStack là một phần mềm mã nguồn mở dùng để quản lý cấu hình và là công cụ để điều kiển từ xa các ứng dụng trên các máy chủ. SaltStack mang tới một hướng tiếp cận mới trong việc quản lý cơ sở hạ tầng trong hệ thống ngày nay. Khi sử dụng Salt bạn sẽ dễ dàng quản lý, vận hành và cấu hình hàng ngàn máy chủ trong thời gian ngắn. 

- SaltStack được viết bằng Python.


# Cài đặt 

SaltStack hoạt động với mô hình client-server, trong đó:
* Máy Server: Được cài đặt gói `salt-master`
* Máy client: Được cài đặt gói `salt-minon`. Thường sẽ có nhiều máy client với các OS khác nhau.

Trong hướng dẫn này sử dụng Ubuntu 14.04 cho cả máy server và máy client.

## Cài đặt trên máy Server - máy `Master`

Đăng nhập với quyền root và thực hiện các lệnh dưới

```sh
apt-get update

apt-get -y install python-software-properties
add-apt-repository ppa:saltstack/salt -y
apt-get update
apt-get -y install salt-master
```

## Cài đặt trên máy Client - máy `Minion`

Cài đặt gói `salt-minion`. 
```sh
apt-get update

apt-get -y install python-software-properties
add-apt-repository ppa:saltstack/salt -y
apt-get update
apt-get -y install salt-minion
```

Mở file /etc/salt/minion, tìm dòng `#master:salt` (dòng 16) và thay thành 

```sh
master: IP_cua_may_Master
```

Hình minh họa: http://prntscr.com/5o0ns1

Sau đó khởi động lại salt
```sh
service salt-minion restart
```

## Thực hiện một số thao tác với SaltStack sau khi cài đặt
### Xác nhận các máy minion 
Đứng trên máy server để thêm vào các private key của các máy minion

```sh
salt-key -L # Liet ke cac public key ma may Master co.
salt-key -A # Them cac key cua may Minion vao trong may Master.
```
Hình minh họa: http://prntscr.com/5o0nfo

Trên màn hình sẽ hiển thị các máy đã kết nối với Master và hỏi xem bạn có tiếp nhận các máy này hay không. Chọn Y để tiếp nhận các key này.

Hãy thử cài đặt một máy thứ 3, sử dụng distro CENTOS 6.5.
```sh
rpm -Uvh http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
yum install salt-minion -y
chkconfig salt-minion on
```
### Thực hiện các lệnh kiểm tra đầu tiên

- Thực hiện lệnh `ping` tới các máy được máy master quản lý.

```sh
salt '*' test.ping
```

Hình minh họa: http://prntscr.com/5o0p70

Trong hình trên, máy client có tên là `controller` đã được ping thành công.


