UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13668;
UPDATE `quest_template` SET `PrevQuestId`=13668, `NextQuestId`=13678, `ExclusiveGroup`=-13829, `NextQuestIdChain`=0 WHERE `Id` IN (13829, 13839, 13838);

UPDATE `quest_template` SET `PrevQuestId`=-13678, `NextQuestId`=0, `ExclusiveGroup`=13673, `NextQuestIdChain`=0 WHERE `Id`=13673;
UPDATE `quest_template` SET `PrevQuestId`=-13678, `NextQuestId`=0, `ExclusiveGroup`=13673, `NextQuestIdChain`=0 WHERE `Id`=13675;
UPDATE `quest_template` SET `PrevQuestId`=-13678, `NextQuestId`=0, `ExclusiveGroup`=13673, `NextQuestIdChain`=0 WHERE `Id`=13674;
UPDATE `quest_template` SET `PrevQuestId`=-13678, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13676;
UPDATE `quest_template` SET `PrevQuestId`=-13678, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13677;

UPDATE `quest_template` SET `PrevQuestId`=13678, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13680;

UPDATE `quest_template` SET `PrevQuestId`=13680 WHERE `Id` IN (13691, 13693, 13694, 13695, 13696);
UPDATE `quest_template` SET `RequiredRaces`=2, `NextQuestId`=13697, `NextQuestIdChain`=13697, `ExclusiveGroup`=13691 WHERE `Id`=13691;
UPDATE `quest_template` SET `RequiredRaces`=128, `NextQuestId`=13719, `NextQuestIdChain`=13719, `ExclusiveGroup`=13693 WHERE `Id`=13693;
UPDATE `quest_template` SET `RequiredRaces`=32, `NextQuestId`=13720, `NextQuestIdChain`=13720, `ExclusiveGroup`=13694 WHERE `Id`=13694;
UPDATE `quest_template` SET `RequiredRaces`=16, `NextQuestId`=13721, `NextQuestIdChain`=13721, `ExclusiveGroup`=13695 WHERE `Id`=13695;
UPDATE `quest_template` SET `RequiredRaces`=512, `NextQuestId`=13722, `NextQuestIdChain`=13722, `ExclusiveGroup`=13696 WHERE `Id`=13696;

UPDATE `quest_template` SET `PrevQuestId`=13701 WHERE `Id` IN (13707, 13708, 13709, 13710, 13711); -- TOScript en el core (revisar 13687)
UPDATE `quest_template` SET `NextQuestId`=13697, `NextQuestIdChain`=13697, `ExclusiveGroup`=13691 WHERE `Id`=13707;
UPDATE `quest_template` SET `NextQuestId`=13719, `NextQuestIdChain`=13719, `ExclusiveGroup`=13693 WHERE `Id`=13708;
UPDATE `quest_template` SET `NextQuestId`=13720, `NextQuestIdChain`=13720, `ExclusiveGroup`=13694 WHERE `Id`=13709;
UPDATE `quest_template` SET `NextQuestId`=13721, `NextQuestIdChain`=13721, `ExclusiveGroup`=13695 WHERE `Id`=13710;
UPDATE `quest_template` SET `NextQuestId`=13722, `NextQuestIdChain`=13722, `ExclusiveGroup`=13696 WHERE `Id`=13711;
UPDATE `quest_template` SET `PrevQuestId`=0, `ExclusiveGroup`=0 WHERE `Id` IN (13697, 13719, 13720, 13721, 13722);
UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=13680 WHERE `Id`=13678;
UPDATE `quest_template` SET `NextQuestId`=13726, `NextQuestIdChain`=13726 WHERE `Id`=13697;
UPDATE `quest_template` SET `NextQuestId`=13727, `NextQuestIdChain`=13727  WHERE `Id`=13719;
UPDATE `quest_template` SET `NextQuestId`=13728, `NextQuestIdChain`=13728  WHERE `Id`=13720;
UPDATE `quest_template` SET `NextQuestId`=13729, `NextQuestIdChain`=13729  WHERE `Id`=13721;
UPDATE `quest_template` SET `NextQuestId`=13731, `NextQuestIdChain`=13731  WHERE `Id`=13722;

UPDATE `quest_template` SET `PrevQuestId`=-13697, `NextQuestId`=0, `ExclusiveGroup`=13762, `NextQuestIdChain`=0 WHERE `Id` IN (13762, 13763, 13764);
UPDATE `quest_template` SET `PrevQuestId`=-13719, `NextQuestId`=0, `ExclusiveGroup`=13768, `NextQuestIdChain`=0 WHERE `Id` IN (13768, 13769, 13770);
UPDATE `quest_template` SET `PrevQuestId`=-13720, `NextQuestId`=0, `ExclusiveGroup`=13773, `NextQuestIdChain`=0 WHERE `Id` IN (13773, 13774, 13775);
UPDATE `quest_template` SET `PrevQuestId`=-13721, `NextQuestId`=0, `ExclusiveGroup`=13778, `NextQuestIdChain`=0 WHERE `Id` IN (13778, 13779, 13780);
UPDATE `quest_template` SET `PrevQuestId`=-13722, `NextQuestId`=0, `ExclusiveGroup`=13783, `NextQuestIdChain`=0 WHERE `Id` IN (13783, 13784, 13785);

UPDATE `quest_template` SET `PrevQuestId`=-13697, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id` IN (13765, 13767, 13856);
UPDATE `quest_template` SET `PrevQuestId`=-13719, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id` IN (13771, 13772, 13857);
UPDATE `quest_template` SET `PrevQuestId`=-13720, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id` IN (13776, 13777, 13858);
UPDATE `quest_template` SET `PrevQuestId`=-13721, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id` IN (13781, 13782, 13860);
UPDATE `quest_template` SET `PrevQuestId`=-13722, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id` IN (13786, 13787, 13859);

UPDATE `quest_template` SET `PrevQuestId`=13697, `NextQuestId`=13736, `ExclusiveGroup`=0, `NextQuestIdChain`=13736 WHERE `Id`=13726;
UPDATE `quest_template` SET `PrevQuestId`=13719, `NextQuestId`=13737, `ExclusiveGroup`=0, `NextQuestIdChain`=13737 WHERE `Id`=13727;
UPDATE `quest_template` SET `PrevQuestId`=13720, `NextQuestId`=13738, `ExclusiveGroup`=0, `NextQuestIdChain`=13738 WHERE `Id`=13728;
UPDATE `quest_template` SET `PrevQuestId`=13721, `NextQuestId`=13739, `ExclusiveGroup`=0, `NextQuestIdChain`=13739 WHERE `Id`=13729;
UPDATE `quest_template` SET `PrevQuestId`=13722, `NextQuestId`=13740, `ExclusiveGroup`=0, `NextQuestIdChain`=13740 WHERE `Id`=13731;

UPDATE `quest_template` SET `PrevQuestId`=13726, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13736;
UPDATE `quest_template` SET `PrevQuestId`=13727, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13737;
UPDATE `quest_template` SET `PrevQuestId`=13728, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13738;
UPDATE `quest_template` SET `PrevQuestId`=13729, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13739;
UPDATE `quest_template` SET `PrevQuestId`=13740, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13740;

UPDATE `quest_template` SET `RequiredRaces`=690 WHERE `Id` IN (13697, 13719, 13720, 13721, 13722);
UPDATE `quest_template` SET `RequiredRaces`=690 WHERE `Id` IN (13726, 13727, 13728, 13729, 13731);
UPDATE `quest_template` SET `RequiredRaces`=690 WHERE `Id` IN (13736, 13737, 13738, 13739, 13740);


UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13667;
UPDATE `quest_template` SET `PrevQuestId`=13667, `NextQuestId`=13672, `ExclusiveGroup`=-13828, `NextQuestIdChain`=0 WHERE `Id` IN (13828, 13837, 13835);
UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=13679 WHERE `Id`=13672;

UPDATE `quest_template` SET `PrevQuestId`=-13672, `NextQuestId`=0, `ExclusiveGroup`=13666, `NextQuestIdChain`=0 WHERE `Id`=13666;
UPDATE `quest_template` SET `PrevQuestId`=-13672, `NextQuestId`=0, `ExclusiveGroup`=13666, `NextQuestIdChain`=0 WHERE `Id`=13670;
UPDATE `quest_template` SET `PrevQuestId`=-13672, `NextQuestId`=0, `ExclusiveGroup`=13666, `NextQuestIdChain`=0 WHERE `Id`=13669;
UPDATE `quest_template` SET `PrevQuestId`=-13672, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13671;
UPDATE `quest_template` SET `PrevQuestId`=-13672, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13625;

UPDATE `quest_template` SET `PrevQuestId`=13672, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13679;

UPDATE `quest_template` SET `PrevQuestId`=13679 WHERE `Id` IN (13684, 13685, 13689, 13688, 13690);
UPDATE `quest_template` SET `RequiredRaces`=1, `NextQuestId`=13718, `NextQuestIdChain`=13718, `ExclusiveGroup`=13684 WHERE `Id`=13684;
UPDATE `quest_template` SET `RequiredRaces`=4, `NextQuestId`=13714, `NextQuestIdChain`=13714, `ExclusiveGroup`=13685 WHERE `Id`=13685;
UPDATE `quest_template` SET `RequiredRaces`=8, `NextQuestId`=13717, `NextQuestIdChain`=13717, `ExclusiveGroup`=13689 WHERE `Id`=13689;
UPDATE `quest_template` SET `RequiredRaces`=64, `NextQuestId`=13715, `NextQuestIdChain`=13715, `ExclusiveGroup`=13688 WHERE `Id`=13688;
UPDATE `quest_template` SET `RequiredRaces`=1024, `NextQuestId`=13716, `NextQuestIdChain`=13716, `ExclusiveGroup`=13690 WHERE `Id`=13690;

UPDATE `quest_template` SET `PrevQuestId`=13700 WHERE `Id` IN (13593, 13703, 13706, 13704, 13705); -- TOScript into the core (check of 13686)
UPDATE `quest_template` SET `NextQuestId`=13718, `NextQuestIdChain`=13718, `ExclusiveGroup`=13718 WHERE `Id`=13593;
UPDATE `quest_template` SET `NextQuestId`=13714, `NextQuestIdChain`=13714, `ExclusiveGroup`=13714 WHERE `Id`=13703;
UPDATE `quest_template` SET `NextQuestId`=13717, `NextQuestIdChain`=13717, `ExclusiveGroup`=13717 WHERE `Id`=13706;
UPDATE `quest_template` SET `NextQuestId`=13715, `NextQuestIdChain`=13715, `ExclusiveGroup`=13715 WHERE `Id`=13704;
UPDATE `quest_template` SET `NextQuestId`=13716, `NextQuestIdChain`=13716, `ExclusiveGroup`=13716 WHERE `Id`=13705;
UPDATE `quest_template` SET `PrevQuestId`=0, `ExclusiveGroup`=0 WHERE `Id` IN (13718, 13714, 13717, 13715, 13716);
UPDATE `quest_template` SET `NextQuestId`=13699, `NextQuestIdChain`=13699 WHERE `Id`=13718;
UPDATE `quest_template` SET `NextQuestId`=13713, `NextQuestIdChain`=13713  WHERE `Id`=13714;
UPDATE `quest_template` SET `NextQuestId`=13725, `NextQuestIdChain`=13725  WHERE `Id`=13717;
UPDATE `quest_template` SET `NextQuestId`=13723, `NextQuestIdChain`=13723  WHERE `Id`=13715;
UPDATE `quest_template` SET `NextQuestId`=13724, `NextQuestIdChain`=13724  WHERE `Id`=13716;

UPDATE `quest_template` SET `PrevQuestId`=-13718, `NextQuestId`=0, `ExclusiveGroup`=13603, `NextQuestIdChain`=0 WHERE `Id` IN (13603, 13600, 13616);
UPDATE `quest_template` SET `PrevQuestId`=-13714, `NextQuestId`=0, `ExclusiveGroup`=13741, `NextQuestIdChain`=0 WHERE `Id` IN (13741, 13742, 13743);
UPDATE `quest_template` SET `PrevQuestId`=-13717, `NextQuestId`=0, `ExclusiveGroup`=13757, `NextQuestIdChain`=0 WHERE `Id` IN (13757, 13758, 13759);
UPDATE `quest_template` SET `PrevQuestId`=-13715, `NextQuestId`=0, `ExclusiveGroup`=13746, `NextQuestIdChain`=0 WHERE `Id` IN (13746, 13747, 13748);
UPDATE `quest_template` SET `PrevQuestId`=-13716, `NextQuestId`=0, `ExclusiveGroup`=13752, `NextQuestIdChain`=0 WHERE `Id` IN (13752, 13753, 13754);

UPDATE `quest_template` SET `PrevQuestId`=-13718, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id` IN (13592, 13665, 13847);
UPDATE `quest_template` SET `PrevQuestId`=-13714, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id` IN (13744, 13745, 13851);
UPDATE `quest_template` SET `PrevQuestId`=-13717, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id` IN (13760, 13761, 13855);
UPDATE `quest_template` SET `PrevQuestId`=-13715, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id` IN (13749, 13750, 13852);
UPDATE `quest_template` SET `PrevQuestId`=-13716, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id` IN (13755, 13756, 13854);

UPDATE `quest_template` SET `PrevQuestId`=13718, `NextQuestId`=13702, `ExclusiveGroup`=0, `NextQuestIdChain`=13702 WHERE `Id`=13699;
UPDATE `quest_template` SET `PrevQuestId`=13714, `NextQuestId`=13732, `ExclusiveGroup`=0, `NextQuestIdChain`=13732 WHERE `Id`=13713;
UPDATE `quest_template` SET `PrevQuestId`=13717, `NextQuestId`=13735, `ExclusiveGroup`=0, `NextQuestIdChain`=13735 WHERE `Id`=13725;
UPDATE `quest_template` SET `PrevQuestId`=13715, `NextQuestId`=13733, `ExclusiveGroup`=0, `NextQuestIdChain`=13733 WHERE `Id`=13723;
UPDATE `quest_template` SET `PrevQuestId`=13716, `NextQuestId`=13734, `ExclusiveGroup`=0, `NextQuestIdChain`=13734 WHERE `Id`=13724;

UPDATE `quest_template` SET `PrevQuestId`=13699, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13702;
UPDATE `quest_template` SET `PrevQuestId`=13713, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13732;
UPDATE `quest_template` SET `PrevQuestId`=13725, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13735;
UPDATE `quest_template` SET `PrevQuestId`=13723, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13733;
UPDATE `quest_template` SET `PrevQuestId`=13734, `NextQuestId`=13794, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13734;

UPDATE `quest_template` SET `RequiredRaces`=1101 WHERE `Id` IN (13718, 13714, 13717, 13715, 13716);
UPDATE `quest_template` SET `RequiredRaces`=1101 WHERE `Id` IN (13699, 13713, 13725, 13723, 13724);
UPDATE `quest_template` SET `RequiredRaces`=1101 WHERE `Id` IN (13702, 13732, 13735, 13733, 13734);

UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=13641, `ExclusiveGroup`=13633, `NextQuestIdChain`=13641 WHERE `Id` IN (13633, 13634);
UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=13643 WHERE `Id`=13641;
UPDATE `quest_template` SET `PrevQuestId`=13641, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=13654 WHERE `Id`=13643;
UPDATE `quest_template` SET `PrevQuestId`=13643, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=13663 WHERE `Id`=13654;
UPDATE `quest_template` SET `PrevQuestId`=13654, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=13664 WHERE `Id`=13663;
UPDATE `quest_template` SET `PrevQuestId`=13663, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=14016 WHERE `Id`=13664;
UPDATE `quest_template` SET `PrevQuestId`=13664, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=14017 WHERE `Id`=14016;
UPDATE `quest_template` SET `PrevQuestId`=14016, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=14017;

UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13794; -- Eadric the Pure 
UPDATE `quest_template` SET `PrevQuestId`=0, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13795; -- The Scourgebane

UPDATE `quest_template` SET `RequiredRaces`=1101, `PrevQuestId`=13794, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13790; -- Alliance Among The Champions
UPDATE `quest_template` SET `RequiredRaces`=1101, `PrevQuestId`=13795, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13793; -- Alliance DK Among The Champions
UPDATE `quest_template` SET `RequiredRaces`=690, `PrevQuestId`=13794, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13811; -- Horde Among The Champions
UPDATE `quest_template` SET `RequiredRaces`=690, `PrevQuestId`=13795, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13814; -- Horde DK Among The Champions

UPDATE `quest_template` SET `RequiredRaces`=1101, `PrevQuestId`=13794, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13861; -- Alliance Battle Before The Citadel
UPDATE `quest_template` SET `RequiredRaces`=1101, `PrevQuestId`=13795, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13864; -- Alliance DK Battle Before The Citadel
UPDATE `quest_template` SET `RequiredRaces`=690, `PrevQuestId`=13794, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13862; -- Horde Battle Before The Citadel
UPDATE `quest_template` SET `RequiredRaces`=690, `PrevQuestId`=13795, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13863; -- Horde DK Battle Before The Citadel

UPDATE `quest_template` SET `RequiredRaces`=1101, `PrevQuestId`=13794, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13789; -- Alliance Taking Battle To The Enemy
UPDATE `quest_template` SET `RequiredRaces`=1101, `PrevQuestId`=13795, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13791; -- Alliance DK Taking Battle To The Enemy
UPDATE `quest_template` SET `RequiredRaces`=690, `PrevQuestId`=13794, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13810; -- Horde Taking Battle To The Enemy
UPDATE `quest_template` SET `RequiredRaces`=690, `PrevQuestId`=13795, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13813; -- Horde DK Taking Battle To The Enemy

UPDATE `quest_template` SET `RequiredRaces`=1101, `PrevQuestId`=13794, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13682; -- Alliance Threat From Above
UPDATE `quest_template` SET `RequiredRaces`=1101, `PrevQuestId`=13795, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13788; -- Alliance DK Threat From Above
UPDATE `quest_template` SET `RequiredRaces`=690, `PrevQuestId`=13794, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13809; -- Horde Threat From Above
UPDATE `quest_template` SET `RequiredRaces`=690, `PrevQuestId`=13795, `NextQuestId`=0, `ExclusiveGroup`=0, `NextQuestIdChain`=0 WHERE `Id`=13812; -- Horde DK Threat From Above

UPDATE `quest_template` SET `ExclusiveGroup`=14102, `NextQuestId`=0, `NextQuestIdChain`=0 WHERE `Id` IN (14102, 14101, 14104, 14105);

UPDATE `quest_template` SET `ExclusiveGroup`=14107, `NextQuestId`=0, `NextQuestIdChain`=0 WHERE `Id` IN (14107, 14108, 14095);

UPDATE `quest_template` SET `PrevQuestId`=13700, `RequiredMinRepFaction`=1094, `RequiredMinRepValue`=42000, `NextQuestId`=0, `NextQuestIdChain`=0 WHERE `Id` IN (14112, 14076, 14090, 14096, 14152, 14080, 14077, 14074); -- Alliance
UPDATE `quest_template` SET `PrevQuestId`=13701, `RequiredMinRepFaction`=1124, `RequiredMinRepValue`=42000, `NextQuestId`=0, `NextQuestIdChain`=0 WHERE `Id` IN (14145, 14092, 14141, 14142, 14136, 14140, 14144, 14143); -- Horde

UPDATE `quest_template` SET `ExclusiveGroup`=14112 WHERE `Id` IN (14112, 14145, 14076, 14092, 14090, 14141); -- A1, H1, A2, H2, A3, H3

UPDATE `quest_template` SET `ExclusiveGroup`=14152 WHERE `Id` IN (14152, 14136, 14080, 14140, 14077, 14144, 14074, 14143); -- A1, H1, A2, H2, A3, H3, A4, H4
UPDATE `quest_template` SET `NextQuestId`=13846, `ExclusiveGroup`=13700 WHERE `Id` IN (13700, 13701); -- Alliance, Horde
UPDATE `quest_template` SET `RequiredMaxRepFaction`=1106, `RequiredMaxRepValue`=42000 WHERE `Id`=13846;
DELETE FROM `creature_questrelation` WHERE `quest` IN (13820, 13681, 13627);
