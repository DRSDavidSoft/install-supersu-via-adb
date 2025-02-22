#IMPORTANT!!!
#THIS SCRIPT IS FOR API21+ armv7 (32bit) devices. If you want to do for device with other API or architecture,
#you may read this article [How to install SuperSu on Android via adb](http://selvaline.blogspot.tw/2015/09/how-to-install-supersu-on-android-via.html)

adb root
adb remount


adb push common/Superuser.apk /system/app/SuperSU/SuperSU.apk
adb shell chmod 0644 /system/app/SuperSU/SuperSU.apk
adb shell chcon u:object_r:system_file:s0 /system/app/SuperSU/SuperSU.apk


adb push common/install-recovery.sh /system/etc/install-recovery.sh
adb shell chmod 0755 /system/etc/install-recovery.sh
adb shell chcon u:object_r:toolbox_exec:s0 /system/etc/install-recovery.sh


adb shell ln -s /system/etc/install-recovery.sh /system/bin/install-recovery.sh


adb push armv7/su /system/xbin/su
adb shell chmod 0755 /system/xbin/su
adb shell chcon u:object_r:system_file:s0 /system/xbin/su

adb push armv7/su /system/bin/.ext/.su
adb shell chmod 0755 /system/bin/.ext/.su
adb shell chcon u:object_r:system_file:s0 /system/bin/.ext/.su

adb push armv7/su /system/xbin/daemonsu
adb shell chmod 0755 /system/xbin/daemonsu
adb shell chcon u:object_r:system_file:s0 /system/xbin/daemonsu


adb push armv7/supolicy /system/xbin/supolicy
adb shell chmod 0755 /system/xbin/supolicy
adb shell chcon u:object_r:system_file:s0 /system/xbin/supolicy


adb push armv7/libsupol.so /system/lib/libsupol.so
adb shell chmod 0644 /system/lib/libsupol.so
adb shell chcon u:object_r:system_file:s0 /system/lib/libsupol.so


adb shell cp /system/bin/app_process32 /system/bin/app_process32_original
adb shell chmod 0755 /system/bin/app_process32_original
adb shell chcon u:object_r:zygote_exec:s0 /system/bin/app_process32_original

adb shell cp /system/bin/app_process32 /system/bin/app_process_init
adb shell chmod 0755 /system/bin/app_process_init
adb shell chcon u:object_r:zygote_exec:s0 /system/bin/app_process_init

adb shell rm -rf /system/bin/app_process
adb shell rm -rf /system/bin/app_process32

adb shell ln -s /system/xbin/daemonsu /system/bin/app_process

adb shell ln -s /system/xbin/daemonsu /system/bin/app_process32

adb shell "echo 1 > /system/etc/.installed_su_daemon"
adb shell /system/xbin/su --install

