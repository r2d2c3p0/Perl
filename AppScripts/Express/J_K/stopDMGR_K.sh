#!/bin/sh

# Revision 2020/03/02 13:05:57  sreddy
# *** added J & K environments ***
#
# stop the WAS Deployment Manager Only

id=`whoami`
case "$id" in
	root*)	sh='su - xadm' ;;
	xadm*)	sh=sh ;;
	operator*)	sh=sh ;;
	*)	echo "$0: must be either xadm or root: aborting"
		exit 1
		;;
esac

DEP=/usr/WebSphereK/Express/profiles/KDmgr/bin

case `hostname` in
	txwast11)
		echo "stop K Deployment Manager"
		$sh -c $DEP/stopManager.sh
		;;
	*)
		echo "$0: this is K environment script, skipping..."
		;;
esac
