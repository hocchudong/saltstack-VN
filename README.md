saltstack-VN
============

Ghi chép về saltstack

Tài liệu tham khảo:

* http://vbyron.com/blog/infrastructure-management-saltstack-part-1-getting-started/
* http://eon01.com/blog/salt-stack-tutorial-for-beginners/
* https://www.digitalocean.com/community/tutorials/how-to-install-salt-on-ubuntu-12-04


# Saltstack là gì !

- SaltStack là một phần mềm mã nguồn mở dùng để quản lý cấu hình và là công cụ để điều kiển từ xa các ứng dụng trên các máy chủ. SaltStack mang tới một hướng tiếp cận mới trong việc quản lý cơ sở hạ tầng trong hệ thống ngày nay. Khi sử dụng Salt bạn sẽ dễ dàng quản lý, vận hành và cấu hình hàng ngàn máy chủ trong thời gian ngắn. 

- SaltStack được viết bằng Python.


# Cài đặt 

SaltStack hoạt động với mô hình client-server, trong đó:
* Máy Server: Được cài đặt gói `salt-master`
* Máy client: Được cài đặt gói `salt-minon`

Trong hướng dẫn này sử dụng Ubuntu 14.04

