#!/bin/bash
echo "Checking whether service directory available or not"
if [ -d "/etc/sv/$1/log" ] ; then  echo "Directory already exists" ;  else mkdir -p /etc/sv/$1/log ; fi

cat <<EOF > /root/app.sh
#!/bin/bash
echo "This is $1 app"
EOF

cat <<EOF > /etc/sv/$1/run
#!/bin/bash
sleep 10
echo "starting app"
exec  /root/app.sh
EOF

cat <<EOF > /etc/sv/$1/log/run
#!/bin/bash
PATH=/bin:/usr/bin:/usr/local/bin:/sbin:/usr/sbin:/usr/local/sbin:/bin
multilog t n100 s16777215 ./main  2>&1
EOF

chmod 755 /etc/sv/$1/run
chmod 755 /etc/sv/$1/log/run
chmod 755 /root/app.sh

echo "Check if symlink exists or not"
if [ -L "/etc/service/$1" ] ; then echo "Softlink already exists...exiting" ; else ln -s /etc/sv/$1  /etc/service/$1 ; fi
