# Copyright (C) 2008-2012 TrinityCore <http://www.trinitycore.org/>
#
# This file is free software; as a special exception the author gives
# unlimited permission to copy and/or distribute it, with or without
# modifications, as long as this notice is preserved.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, to the extent permitted by law; without even the
# implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

set(scripts_STAT_SRCS
  ${scripts_STAT_SRCS}

  Custom/argent_tournament.cpp
  Custom/dalaran_squirrel.cpp
  Custom/cs_event_system.cpp
  Custom/npc_reward_system.cpp
  Custom/rebirth_custom_fixes.cpp
  Custom/theme_changer.cpp
)

message("  -> Prepared: Custom")
