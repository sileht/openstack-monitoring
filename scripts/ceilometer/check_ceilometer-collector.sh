#!/bin/bash
#
# Ceilometer Collector monitoring script
#
# Copyright © 2013 eNovance <licensing@enovance.com>
#
# Author: Emilien Macchi <emilien.macchi@enovance.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#

set -e

. `dirname $0`/functions.sh
DAEMON='ceilometer-collector'


usage ()
{
    echo "Usage: $0 [OPTIONS]"
    echo " -h               Get help"
    echo "No parameter : Just run the script"
}

while getopts 'h' OPTION
do
    case $OPTION in
        h)
            usage
            exit 0
            ;;
        *)
            usage
            exit 1
            ;;
    esac
done

check_running_and_amqp_connected $DAEMON
