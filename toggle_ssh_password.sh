#!/bin/sh

SSH_CONFIG="sshd_config"

enable_unsafe_password_authenctication()
{
	echo "Enabling password"
	mv "$SSH_CONFIG" "$SSH_CONFIG.safe"
	mv "$SSH_CONFIG.unsafe" "$SSH_CONFIG"
}

disable_unsafe_password_authenctication()
{
	echo "Disabling password"
	mv "$SSH_CONFIG" "$SSH_CONFIG.unsafe"
	mv "$SSH_CONFIG.safe" "$SSH_CONFIG"
}

restart_sshd()
{
	echo "Restarting SSH Daemon"
	systemctl restart sshd
}

cd /etc/ssh/ || exit

if [ ! -f "$SSH_CONFIG.safe" ] && [ ! -f "$SSH_CONFIG.unsafe" ]; then
  echo "Please set up a safe and unsafe version of sshd_config"
  exit
fi

case "$1" in
	"on")
		[ -f "$SSH_CONFIG.safe" ] && [ ! -f "$SSH_CONFIG.unsafe" ] && echo "Password already enabled, exiting..." && exit
		enable_unsafe_password_authenctication
		restart_sshd
    grep -m1 PasswordAuthentication "$SSH_CONFIG"
		;;
	"off")
		[ -f "$SSH_CONFIG.unsafe" ] && [ ! -f "$SSH_CONFIG.safe" ] && echo "Password already disabled, exiting..." && exit
		disable_unsafe_password_authenctication
		restart_sshd
    grep -m1 PasswordAuthentication "$SSH_CONFIG"
		;;
	*)
		echo "Usage: toggle_ssh_password.sh [on,off]"
esac

cd || exit
