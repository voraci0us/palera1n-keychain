pkill -9 iproxy
iproxy 2222 44 &
sshpass -p alpine scp -o StrictHostKeyChecking=no -P2222 updateEntitlements.sh root@localhost:/var/jb/usr/bin
sshpass -p alpine scp -o StrictHostKeyChecking=no -P2222 keychain_dumper root@localhost:/var/jb/usr/bin
sshpass -p alpine ssh -o StrictHostKeyChecking=no -p 2222 root@localhost << 'EOF'
export PATH=$PATH:/var/jb/usr/bin
chmod +x /var/jb/usr/bin/updateEntitlements.sh /var/jb/usr/bin/keychain_dumper
/var/jb/usr/bin/updateEntitlements.sh
/var/jb/usr/bin/keychain_dumper
EOF

