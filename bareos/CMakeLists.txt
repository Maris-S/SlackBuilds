#   BAREOS® - Backup Archiving REcovery Open Sourced
#
#   Copyright (C) 2018-2020 Bareos GmbH & Co. KG
#
#   This program is Free Software; you can redistribute it and/or
#   modify it under the terms of version three of the GNU Affero General Public
#   License as published by the Free Software Foundation and included
#   in the file LICENSE.
#
#   This program is distributed in the hope that it will be useful, but
#   WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
#   Affero General Public License for more details.
#
#   You should have received a copy of the GNU Affero General Public License
#   along with this program; if not, write to the Free Software
#   Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
#   02110-1301, USA.
#
#   This file is modified by Maris-S (use it on your own risk)
#   This is modified 'core/platforms/freebsd/CMakeLists.txt' file
#   (Added part which installs '/etc/rc.d/fuctions.bareos' file

message("Entering ${CMAKE_CURRENT_SOURCE_DIR}")

set(DESTSTARTDIR "${sysconfdir}/rc.d/")

message(STATUS "installing startfiles to ${DESTSTARTDIR}")

# Install autostart fd
install(
  FILES "${CMAKE_CURRENT_LIST_DIR}/rc.bareos-fd"
  DESTINATION "${DESTSTARTDIR}/"
  PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE
              WORLD_READ WORLD_EXECUTE
)

# Install autostart sd
install(
  FILES "${CMAKE_CURRENT_LIST_DIR}/rc.bareos-sd"
  DESTINATION "${DESTSTARTDIR}/"
  PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE
              WORLD_READ WORLD_EXECUTE
)

# Install autostart dir
install(
  FILES "${CMAKE_CURRENT_LIST_DIR}/rc.bareos-dir"
  DESTINATION "${DESTSTARTDIR}/"
  PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE
              WORLD_READ WORLD_EXECUTE
)

# Install functions
install(
  FILES "${CMAKE_CURRENT_LIST_DIR}/functions.bareos"
  DESTINATION "${DESTSTARTDIR}/"
  PERMISSIONS OWNER_READ OWNER_WRITE OWNER_EXECUTE GROUP_READ GROUP_EXECUTE
              WORLD_READ WORLD_EXECUTE
)
