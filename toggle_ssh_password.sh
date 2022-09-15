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

case "$1" in
	"on")
		[ -f "$SSH_CONFIG.safe" ] && [ ! -f "$SSH_CONFIG.unsafe" ] && echo "Password already enabled, exiting..." && exit
		enable_unsafe_password_authenctication
		restart_sshd
		;;
	"off")
		[ -f "$SSH_CONFIG.unsafe" ] && [ ! -f "$SSH_CONFIG.safe" ] && echo "Password already disabled, exiting..." && exit
		disable_unsafe_password_authenctication
		restart_sshd
		;;
	*)
		echo "Usage: toggle_ssh_password.sh [on,off]"
esac

cd || exit
