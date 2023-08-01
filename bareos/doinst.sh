config() {
  NEW="$1"
  OLD="$(dirname $NEW)/$(basename $NEW .new)"
  # If there's no config file by that name, mv it over:
  if [ ! -r $OLD ]; then
    mv $NEW $OLD
  elif [ "$(cat $OLD | md5sum)" = "$(cat $NEW | md5sum)" ]; then
    # toss the redundant copy
    rm $NEW
  fi
  # Otherwise, we leave the .new copy for the admin to consider...
}

preserve_perms() {
  NEW="$1"
  OLD="$(dirname $NEW)/$(basename $NEW .new)"
  if [ -e $OLD ]; then
    cp -a $OLD ${NEW}.incoming
    cat $NEW > ${NEW}.incoming
    mv ${NEW}.incoming $NEW
  fi
  config $NEW
}

preserve_perms etc/rc.d/functions.bareos.new
preserve_perms etc/rc.d/rc.bareos-dir.new
preserve_perms etc/rc.d/rc.bareos-fd.new
preserve_perms etc/rc.d/rc.bareos-sd.new
config %sysconfdir%/logrotate.d/bareos-dir.new
config %sysconfdir%/bareos-webui/configuration.ini.new
config %sysconfdir%/bareos-webui/directors.ini.new
config %sysconfdir%/httpd/extra/bareos-webui.conf.new
config %sysconfdir%/bareos/bsmc.conf.new
config %sysconfdir%/bareos/bareos-dir.d/profile/webui-readonly.conf.new
config %sysconfdir%/bareos/bareos-dir.d/profile/webui-admin.conf.new
config %sysconfdir%/bareos/mtx-changer.conf.new
