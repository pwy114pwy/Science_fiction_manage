/*
Navicat MySQL Data Transfer

Source Server         : root
Source Server Version : 50740
Source Host           : localhost:13306
Source Database       : science_fiction

Target Server Type    : MYSQL
Target Server Version : 50740
File Encoding         : 65001

Date: 2025-01-22 01:26:46
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for author
-- ----------------------------
DROP TABLE IF EXISTS `author`;
CREATE TABLE `author` (
  `Author_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Author_Name` varchar(255) DEFAULT NULL,
  `Author_Introduction` varchar(999) DEFAULT NULL,
  PRIMARY KEY (`Author_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of author
-- ----------------------------
INSERT INTO `author` VALUES ('1', '刘慈欣', '刘慈欣，男，汉族，1963年6月23日出生于北京，祖籍河南，高级工程师、科幻作家。中国作家协会第九届和十届全委会委员、中国作家协会会员、中国科普作家协会会员、山西省作家协会副主席、阳泉市作家协会第五届理事会名誉主席、阳泉市文联名誉主席、刘慈欣文学院终身名誉院长。');
INSERT INTO `author` VALUES ('2', '艾萨克·阿西莫夫', '艾萨克·阿西莫夫（Isaac Asimov，1920年1月2日-1992年4月6日），俄罗斯犹太裔美国科幻小说作家、科普作家、文学评论家，美国科幻小说黄金时代的代表人物之一。');
INSERT INTO `author` VALUES ('7', '121', '1111');

-- ----------------------------
-- Table structure for book
-- ----------------------------
DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` (
  `Book_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Book_Name` varchar(255) DEFAULT NULL,
  `Tag` varchar(255) DEFAULT NULL,
  `Img_Url` varchar(255) DEFAULT NULL,
  `Topic` varchar(255) DEFAULT NULL,
  `Author_ID` int(11) DEFAULT NULL,
  `Author` varchar(255) DEFAULT NULL,
  `Rating` int(255) DEFAULT NULL,
  `Book_Introduce` varchar(999) DEFAULT NULL,
  PRIMARY KEY (`Book_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book
-- ----------------------------
INSERT INTO `book` VALUES ('1', '三体', 'classic', '../../static/books_img/三体.jpg', '星际文明 超级科技', '1', '刘慈欣', '5', '文化大革命如火如荼地进行，天文学家叶文洁在其间历经劫难，被带到军方绝秘计划“红岸工程”。叶文洁以太阳为天线，向宇宙发出地球文明的第一声啼鸣，取得了探寻外星文明的突破性进展。三颗无规则运行的太阳主导下，四光年外的“三体文明”百余次毁灭与重生，正被逼迫不得不逃离母星，而恰在此时，他们接收到了地球发来的信息。对人性绝望的叶文洁向三体人暴露了地球的坐标，彻底改变了人类的命运。');
INSERT INTO `book` VALUES ('2', '球状闪电', 'classic', '../../static/books_img/球状闪电.jpg', '超级科技 奇异自然', '1', '刘慈欣', '4', '在某个离奇的雨夜，一颗球状闪电闯进了少年的视野。它的啸叫低沉中透着尖利，像是一个鬼魂在太古的荒原上吹着埙。当鬼魂奏完乐曲，球状闪电在一瞬间将少年的父母化为灰烬，而他们身下板凳却是奇迹般的冰凉。\r\n\r\n这一夜，少年的命运被彻底改变了，他将毕其一生去解开那个将他变成孤儿的自然之谜。但是他未曾想到，多年以后，单纯的自然科学研究被纳入进“新概念武器”开发计划，他所追寻的球状闪电变成了下一场战争中决定祖国生存或是灭亡的终极武器！\r\n\r\n当被禁锢在终极武器中的大自然的伟力被释放时，一轮冰冷的“蓝太阳”升起在大西部的戈壁滩上，整个戈壁淹没在它的蓝光中，这个世界变得陌生而怪异。一个从未有人想像过的未来，在宇宙观测者的注视下，降临在人类面前……');
INSERT INTO `book` VALUES ('3', '流浪地球', ' classic hot', '../../static/books_img/流浪地球.jpg', '未来世界 社会科幻', '1', '刘慈欣', '5', '小说《流浪地球》讲述了太阳内部氢转化成氦的速度突然加快，人类面临灭顶之灾。各个国家合作成立联合政府，决定实施一项长达2500年的宏大计划：建造行星发动机将地球推离太阳系。然而，“地球发动机加速造成的潮汐吞没了北半球三分之二的大城市，发动机带来的全球高温融化了极地冰川”。面对死亡的威胁，人类变得悲观无助，末日心态滋生。但当地球安然流浪三百多年后，人们发现太阳并未发生变化，于是开始怀疑“流浪地球”计划只是联合政府的阴谋。最终，谣言和猜忌点燃了蔓延全球的叛乱之火。就在人们为起义的胜利手舞足蹈时，太阳氦闪爆发。小说突出了无处安身的人们面对家园毁灭时的无奈、痛苦、恐惧、绝望，反映了人在自然、宇宙面前的渺小，着重刻画了“人在灾难中”的情状。');
INSERT INTO `book` VALUES ('4', '带上她的眼睛', 'hot', '../../static/books_img/带上她的眼睛.jpg', '硬科幻 社会科幻', '1', '刘慈欣', '3', '该小说讲述了“我”，某航天中心的个人装备工程师，在去旅行时带上了“她”的眼睛（中微子眼镜），这样就可以把旅行中的感受传给“她”。“她”是失事的“落日六号”地层飞船上的领航员，被永远困在地心里。在旅行交流中，“我”慢慢恢复了对美的感受，学会了以新的目光欣赏大自然，重新打量自己的生活。在该小说中，作者既没有采用科幻小说惯常的上帝视角，也没有使用宏大架构下元叙事来讲述，而是采用第一人称的角度来讲述“我”和沈静相互拯救的故事，文本核心依然关注的是人类的命运，即一个人精神家园的广度突破生命的局限来获得精神上的自由和实现自身的价值。');
INSERT INTO `book` VALUES ('5', '银河帝国', 'classic hot', '../../static/books_img/银河帝国.jpg', '硬科幻 社会科幻', '2', '艾萨克·阿西莫夫', '5', '该小说讲述了在机器人的帮助下，人类迅速掌握了改造外星球的技术，开启了恢弘的星际殖民运动；人类在银河系如蝗虫般繁衍扩张，带着他们永不磨灭的愚昧与智慧、贪婪与良知，登上了一个个荒凉的星球，并将银河系卷入漫长的星际战国时代，直至整个银河被统一，一个统治超过2500万个住人行星、疆域横跨十万光年、总计数兆亿人口的庞大帝国崛起——银河帝国。');
INSERT INTO `book` VALUES ('20', '超新星纪元', 'classic hot', '../../static/books_img/超新星纪元.jpg', '星际文明 社会科幻', '1', '刘慈欣', '5', '此书中刘慈欣创造了一个孩子掌控的世界，但是在这个世界中，孩子们对以往成人心目中的纯洁的儿童形象进行大胆的反叛与颠覆。这些世界的新主人们，虽然与成人一般进行战争，但是他们把战争当做游戏，在纯洁的南极大陆上，进行着最血腥的战斗与厮杀。坦克、航母、歼击机、核弹头……所有武器，都是他们的新玩具。有人称《超新星纪元》为中国长篇科幻小说的零坐标。');
INSERT INTO `book` VALUES ('33', '大大', 'hot classic', '../../static/books_img/大大.jpg', '问问', null, '刘慈欣', '5', '111');

-- ----------------------------
-- Table structure for characters
-- ----------------------------
DROP TABLE IF EXISTS `characters`;
CREATE TABLE `characters` (
  `Character_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Illustrated_ID` int(11) DEFAULT NULL,
  `Illustrated_Name` varchar(255) DEFAULT NULL,
  `Role_Name` varchar(255) DEFAULT NULL,
  `X_Position` varchar(255) DEFAULT NULL,
  `Y_Position` varchar(255) DEFAULT NULL,
  `Role_Introduction` varchar(999) DEFAULT NULL,
  `Role_Image` varchar(255) DEFAULT NULL,
  `Tag` varchar(255) DEFAULT NULL,
  `Classic_Quotes` varchar(255) DEFAULT NULL,
  `Contribute_1` varchar(999) DEFAULT NULL,
  `Contribute_2` varchar(999) DEFAULT NULL,
  `Contribute_3` varchar(999) DEFAULT NULL,
  `Contribute_4` varchar(999) DEFAULT NULL,
  `Contribute_5` varchar(999) DEFAULT NULL,
  `Contribute_6` varchar(999) DEFAULT NULL,
  `Power_Ability` varchar(255) DEFAULT NULL,
  `Intellect_Ability` varchar(255) DEFAULT NULL,
  `Decision_Ability` varchar(255) DEFAULT NULL,
  `Influence_Ability` varchar(255) DEFAULT NULL,
  `Moral_Ability` varchar(255) DEFAULT NULL,
  `Will_Ability` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Character_ID`),
  KEY `character_to_Illustrated` (`Illustrated_ID`),
  KEY `Role_Name` (`Role_Name`),
  KEY `Role_Name_2` (`Role_Name`),
  KEY `character_to_Illustrated_name` (`Illustrated_Name`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of characters
-- ----------------------------
INSERT INTO `characters` VALUES ('1', '1', '三体', '罗辑', '300', '500', '罗辑（英文名：Logic，公元1979年—掩体67年），刘慈欣所著科幻小说《三体》系列中的人物，初次登场于《三体》第二部《黑暗森林》的序章。毕业于清华大学，曾任面壁者、 执剑人、 地球文明博物馆工程委员会主席等职， 其妻为庄颜。', '../../static/role_image/罗辑.jpg', '救世主,面壁人,人类希望,孤独者', '这就是人类的命运，只有一步一步走下去，毫无选择。|黑暗森林法则：生存是宇宙中唯一的法则。|当人类遇到三体文明时，所谓的理智和道德是没有任何意义的。|即使人类赢得了这场战争，胜利也不代表人类的未来。', '90|初任面壁者|罗辑本只打算用宇宙社会学在学术上哗众取宠，不料却引来了智子的监视，并遭受了一场ETO精心策划包装成车祸的暗杀。罗辑侥幸逃脱，短期女友被撞身亡。罗辑因这次“意外”被史强护送带走，随后出席参加位于联合国大厦内面壁计划的公布会议。针对三体文明思维透明、计谋低劣的特点，人类推出了面壁计划，面壁者完全依靠自己的思维制订战略计划，伪装、误导和欺骗敌人；拥有很高的权力，并且不必对自己的行为和命令作出解释。会议中，一无所知的罗辑被任命为应对三体危机的第四位面壁者。罗辑离开后在广场上再次遭到暗杀，因防弹衣保住了性命。', '90|发射“咒语”|一天，庄颜以及孩子突然被带走送入冬眠，只留下“我们在末日等你”的字条，罗辑平静的生活随即被打破。罗辑去找萨伊理论，萨伊提醒他要为了妻女承担责任，并告诉他，他之所以被选为面壁人，是因为他是唯一一个三体文明要杀的人类。罗辑意识到关键在于当初与叶文洁的对话，遂开始回想并思考，一段时间后慢慢有了头绪，在得到真相的时刻意外坠入冰湖。', '90|推出法则|罗辑冬眠了长达160多年的时间，期间地球经历了大低谷与第二次文艺复兴等时代，多个未受智子影响的科学领域得到蓬勃发展，最终使罗辑治愈。此时的人类因为太空舰队的发展，普遍对战胜三体文明具有很高的自信。结束冬眠的罗辑解除了面壁者的身份，面壁计划与他的“诅咒”也成为古代的笑话。然而，罗辑一天之内遭到ETO所遗留的KILLER5.2病毒的六次追杀，幸得为重逢的史强所救。三体的“水滴”抵达太阳系后，使人类的太空舰队几乎全军覆没，人类陷入绝望危机；罗辑却注意到水滴即刻“封锁”了太阳，使人类无法使用恒星级功率发送咒语。与此同时，“咒语”被证实，希恩斯和乔纳森告知罗辑187J3X1恒星在五十一年前被摧毁。面壁计划重新启动，罗辑被再度任命为面壁者，且被民众视若神明。罗辑随后在沙漠向史强揭示黑暗森林法则，文明只要在宇宙中暴露坐标，就会被视作威胁抹去。', '80|威慑三体|由于太阳已经被封锁，罗辑利用另一位面壁者曼努尔·雷迪亚兹在失败的雪地工程中留下的恒星级氢弹与海王星油膜物质，制造太空尘埃云，以便在水滴穿过时使其线路踪迹。然而这个计划并未得到普遍的支持，最后部署的恒星级氢弹与油膜物质也远远不够，罗辑渐渐失去民众的信任，危机纪元208年，罗辑被赶出了小区。被赶走的罗辑带着铁锹去往杨冬的坟墓，叶文洁的坟墓也在旁边。他在一旁为自己挖墓穴，因为高烧与体力不支，他只挖了稍浅的一个墓穴后便睡着。醒来后，他对叶文洁墓碑上的蚂蚁道歉，随即向三体世界喊话，一旦他死去，所有雪地工程的核弹就会被引爆，油膜物质将在爆炸中形成围绕太阳的三千六百一十四团星际尘埃，从远方观察，太阳将在可见光和其他高频波段发生闪烁。经过精心布置的核弹将使太阳闪烁形成的信号发送出三张简单的图形，它们组合成一张三体世界与周围三十颗恒星的相对位置的三维坐标图。太阳将会把针对三体的“咒语”发送出去，同时太阳系和地球的位置也会暴露，两个文明都会被毁灭。', '80|研究曲率|在程心与罗辑进行交接时，作为引力波广播系统的一部分，万有引力号正在追击末日战役中逃亡的蓝色空间号。两艘战舰得知三体对地球发动打击，经过投票后，万有引力发出引力波宇宙广播，自此地球与三体的坐标暴露，二者都成为随时可能遭到其他文明打击的危险之地，三体人遂决定离开地球。广播纪元由此开始。 广播纪元3年，三体母星被来自未知文明的光粒摧毁。三体星系毁灭后的第三天，智子邀请罗辑和程心一同前去茶道谈话，智子向其透露人类能够向宇宙发布安全声明，却没有说明操作方法。三体人离开前，允许曾将自己的大脑送入太空、后被三体第一舰队捕获的云天明与程心相见，云天明其讲述三个童话故事。程心从中得到人类得到两种保存文明的方法，其中一种为建造曲率驱动引擎飞船逃离地球，该项目由维德主导。在研发成功前，人类以木星、土星、天王星、海王星为掩体，在背阳面建造太空城。罗辑则担任地球文明博物馆建造委员会的主席，主持建造“地球文明博物馆”，使得人类消亡以后能够长久地保存下文明的一部分遗产和信息。 维德死后，曲率驱动的研究搁置三十五年后才逐渐重启，罗辑秘密接手了研究计划和研发团队。 ', '60|文明墓碑|掩体纪元67年，太阳系遭到其他文明的二向箔打击，太阳系开始陷入二维化，为应对光粒准备的掩体无法保护地球文明。冥王星同样无法逃脱二向箔的打击，程心与艾AA遂在最后的几天时间里乘坐“星环号”前往冥王星，试图运出博物馆中的部分文物使其单独跌落到二维，以保存其结构。在冥王星，程心再度见到了罗辑。此时罗辑已年近两百，融合了以往的玩世不恭与久经沧桑的超然，不再像过去作为执剑人时那般威严。罗辑在过去几十年建造博物馆的过程中，发现现代的量子储存器储存信息的时间不够长，经过研究，发现把信息保存一亿年左右的唯一方法是把字刻在石头上。罗辑称这并非地球文明的博物馆，而是“墓碑”。 罗辑让程心与艾AA按心意拿走博物馆中的文物，但要求将《蒙娜丽莎》留下。艾AA揶揄罗辑留下了最贵的一幅，程心却发现罗辑看着《蒙娜丽莎》热泪盈眶。随后三人一同搬运文物，并观看了地球与太阳被二维化的场景。罗辑提醒程心尽早离开，而他则选择留在冥王星。程心等人离开后，罗辑联系程心，告诉程心他接手的曲率驱动引擎飞船项目已经取得了成功，而程心所乘坐的“星环号”即为唯一一艘可以逃脱二向箔打击的曲率驱动引擎飞船。程心想要回来接罗辑，罗辑表示拒绝，并称“自己什么也没有失去”，随即使用最高指令权让星环号载程心与艾AA逃离太阳系，自己则与太阳系一同接受二向箔的攻击。最终罗辑被二维化。', '80', '90', '99', '89', '99', '99');
INSERT INTO `characters` VALUES ('2', '1', '三体', '汪淼', '100', '500', '汪淼，刘慈欣所著科幻小说《三体》系列中的角色，第一部《地球往事》的男主角。应用物理学科学家，主要研究纳米材料，为古筝行动提供“纳米飞刃”，对消灭人类叛军ETO降临派组织作出了不俗的贡献。', '../../static/role_image/汪淼.jpg', '摄影师,科学家', '物理学，没有不存在，只是我们认为的物理学，可能不存在。|\n越透明的东西越神秘，宇宙本身就是透明的，只要目力能及，你想看多远就看多远，但越看越神秘。|\n一切的一切都导向这样一个结果：物理学从来就没有存在过，将来也不会存在。我知道自己这样做是不负责任的，但别无选择。', '90|科学边界|汪淼在《三体》第一部中前往调查组织“科学边界”，眼前出现幽灵倒计时并看见宇宙闪烁，后来得知是“智子”在视网膜上打印数字，汪淼的经历是《三体》系列的一大线索，勾连起叶文洁与地球三体运动的起源，麦克·伊文斯的经历和最后三体入侵的故事。', '90|古筝行动|古筝行动采用了汪淼研究的“纳米飞刃”，行动中ETO降临派重要成员伊文斯死亡并且联合国获得了ETO的重要信息。 [1]结局中，与丁仪和史强一起去看麦田里的蝗虫，重拾对生活的信心。作为一个小视角，侧面展开了人类和三体文明长达四个世纪的抗争。', '', '', '', '', '80', '80', '80', '80', '80', '80');
INSERT INTO `characters` VALUES ('3', '1', '三体', '叶文洁', '300', '300', '叶文洁（1947年6月～2007年），刘慈欣科幻小说作品《三体》中的一个重要角色，天体物理学家，担任过清华大学教授、ETO统帅，是杨冬的母亲。诱使人类毁灭的一切，皆因她而起。她完成了人类第一次Ⅱ型文明能级的发射，并与三体文明初次接触。虽然她背叛了全人类，但也为人类留下了一线生机。', '../../static/role_image/叶文洁.jpg', '天才科学家,人类的叛徒,理想主义', '弱小和无知不是生存的障碍，傲慢才是。|人类文明的未来注定是黑暗的，因为人类没有足够的智慧和理性去解决这些问题。|我曾经希望三体文明能帮助我们，但现在我已经知道，三体的到来并非是解救，而是审判。|历史的车轮已经碾过了我们每一个人，我们终究无法逃避。', '90|文革的创伤|叶文洁成长于20世纪50年代的中国，她的父亲叶继光是一名学者，因文化大革命中的政治斗争而遭到迫害。叶文洁的父亲是一个直言不讳的知识分子，因批评毛泽东的政策而被打成“反革命分子”。在一次公审中，叶继光被暴徒残忍折磨致死，叶文洁亲眼目睹了这一切。这一事件让叶文洁对人类社会产生了深深的失望，尤其是对人类的暴力和自私本性感到无法忍受。这也成为她后来的思想转变和决定的根源之一。她认为，地球社会充斥着无休止的暴力、压迫和对理性的否定，而这些问题没有任何实际解决办法。父亲的死是她心灵的创伤，深刻影响了她的世界观和人生态度。', '90|红岸基地的工作|叶文洁的命运在文化大革命后迎来了新的转折。在受到迫害的背景下，叶文洁成为了红岸基地的工作人员。红岸基地是中国的一个秘密军事基地，专门从事与外太空的通讯工作，特别是通过强大的电磁波设备发射信号到宇宙中去。叶文洁在此担任物理学家的工作，负责分析和处理信号。通过对信号的研究，她接触到了大量前沿的科技和军事机密。\r\n\r\n在这个过程中，叶文洁开始逐渐发现，虽然地球科技不断进步，但与宇宙其他文明相比，地球仍然处于非常落后的阶段。她的工作使她接触到了与外星文明的初步接触，也让她意识到，地球人类的科技和智慧在浩瀚宇宙面前几乎微不足道。这一认知让她对人类的未来充满了悲观和绝望。', '80|接触外星文明|叶文洁在红岸基地的工作中，逐渐对地球人类的社会失去了信心。在目睹了父亲的惨死、社会的不公与暴力后，她对人类社会的丑陋面有了深刻的认识。与此同时，她对外星文明产生了强烈的向往，她认为外星文明可能具有比人类更高的理性和文明，能够带来地球社会的改变。\r\n\r\n有一天，在红岸基地，叶文洁偶然间发现了一个可能与外星文明沟通的机会。在一次对外太空信号的发送过程中，她在一种情感驱使下，决定向宇宙发送一个信号，向外星文明求救。这一信号最终被三体文明接收。她期望通过与外星文明的接触，寻找一种改变人类社会的力量，从而结束人类社会的暴力与不公。', '80|与三体文明接触|叶文洁的行动最终导致了人类与三体文明的第一次接触。在发送信号后，叶文洁与三体文明建立了直接的联系，三体文明回应了她的信号。这一联系并非即时，而是经过了漫长的时间和复杂的信号传递过程。三体文明的回应让叶文洁更加坚定了她对外星文明的信任和对人类社会的绝望。\r\n\r\n三体文明的智慧远远超出地球文明，它的科技水平是人类无法想象的。这种文明拥有完全不同的生存方式，它的星球环境也与地球截然不同。这一接触不仅让叶文洁深刻意识到人类文明的局限性，也为后续三体文明对地球的侵略计划埋下了伏笔。', '80|加入“地球三体组织”|在与三体文明的接触后，叶文洁渐渐形成了对人类文明的彻底失望，认为人类无法自我救赎。她加入了一个名为“地球三体组织”的秘密组织，组织成员大多是对人类社会失去信心的人，他们希望借助三体文明的力量推翻现有的社会秩序，甚至认为三体文明的到来可能是人类的“救赎”。这个组织的目标是促进三体文明的入侵，帮助外星文明统治地球。\r\n\r\n叶文洁在这个组织中扮演了重要角色，她的行为也象征着她对人类社会的彻底绝望。她认为，只有外星文明的到来，才能使人类摆脱战争、饥荒和贫困，迎来一个新的、更加理性的世界。她参与了许多破坏性行动，为三体文明的入侵铺路。', '90|反思与决定|随着三体文明的逐渐侵略，叶文洁开始面临更深的道德困境。虽然她一直认为三体文明能够为地球带来一个新的秩序，但当她看到三体文明的到来可能会导致人类的灭绝时，她开始重新审视自己的决定。在《三体》系列的后期，叶文洁经历了内心的挣扎和反思，她开始意识到三体文明并非完美无缺，可能存在对地球文明的极端压迫。她的内心发生了复杂的变化，甚至开始对三体文明的入侵产生了恐惧和疑虑。\r\n\r\n最终，叶文洁决定采取一种较为保守的策略，她希望通过人类自己的努力，寻找一条既能抵御外来威胁，又能改善人类社会的道路。在《三体》的后续情节中，叶文洁不仅是地球文明的历史见证者，也成为了一个重要的决策者，她的决定最终影响了人类与三体文明之间的命运走向。\r\n\r\n叶文洁的经历深刻体现了《三体》中的核心主题：人类文明的脆弱、科技的双刃剑效应以及人类在面对未知时的复杂反应。她的个人选择和命运是小说中最具哲学深度的部分之一，也引发了关于人类文明、伦理和外星生命的深刻讨论。', '60', '90', '90', '90', '60', '99');
INSERT INTO `characters` VALUES ('4', '1', '三体', '史强', '300', '700', null, '../../static/role_image/史强.jpg', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `characters` VALUES ('5', '1', '三体', '杨卫宁', '500', '300', null, '../../static/role_image/杨卫宁.jpg', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `characters` VALUES ('6', '1', '三体', '杨冬', '500', '450', null, '../../static/role_image/杨冬.jpg', null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `characters` VALUES ('7', '1', '三体', '丁仪', '500', '600', null, '../../static/role_image/丁仪.jpg', '', null, '1233', '12', '', '', '', '', null, null, null, null, null, null);
INSERT INTO `characters` VALUES ('13', '1', '三体', '彭炜业', '200', '900', '彭炜业，男，2003年出生，江西樟树人', '../../static/role_image/彭炜业.jpg', '仙人,救世主', '我太厉害了|开！！！|我，是无敌的', '99|修仙|彭炜业修炼成功得道飞升', '99|飞升|2035年得道飞升', '', '', '', '', '99', '99', '99', '99', '99', '99');
INSERT INTO `characters` VALUES ('14', '2', '球状闪电', '林云', '1', '1', '11', '../../static/role_image/林云.jpg', '111', '11|22', '90|球状闪电|111', '', '', '', '', '', '99', '99', '9', '20', '50', '99');

-- ----------------------------
-- Table structure for collect
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `Collect_Id` int(255) NOT NULL AUTO_INCREMENT,
  `User_Name` varchar(255) DEFAULT NULL,
  `Book_ID` int(11) DEFAULT NULL,
  `Book_Name` varchar(255) DEFAULT NULL,
  `Collect_Time` varchar(255) DEFAULT NULL,
  `Img_Url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Collect_Id`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of collect
-- ----------------------------
INSERT INTO `collect` VALUES ('34', '2', '2', '球状闪电', '2024年11月24日14:00:29', '../../static/books_img/球状闪电.jpg');
INSERT INTO `collect` VALUES ('63', '1', '1', '三体', '2025年01月06日15:57:12', '../../static/books_img/三体.jpg');
INSERT INTO `collect` VALUES ('64', '1', '2', '球状闪电', '2025年01月09日14:50:08', '../../static/books_img/球状闪电.jpg');
INSERT INTO `collect` VALUES ('65', '1', '3', '流浪地球', '2025年01月09日14:50:10', '../../static/books_img/流浪地球.jpg');
INSERT INTO `collect` VALUES ('66', '1', '5', '银河帝国', '2025年01月09日14:50:15', '../../static/books_img/银河帝国.jpg');
INSERT INTO `collect` VALUES ('67', '1', '33', '大大', '2025年01月09日14:50:18', '../../static/books_img/大大.jpg');
INSERT INTO `collect` VALUES ('68', '2', '1', '三体', '2025年01月09日14:50:37', '../../static/books_img/三体.jpg');
INSERT INTO `collect` VALUES ('69', '2', '3', '流浪地球', '2025年01月09日14:50:41', '../../static/books_img/流浪地球.jpg');
INSERT INTO `collect` VALUES ('70', '3', '1', '三体', '2025年01月09日14:50:56', '../../static/books_img/三体.jpg');
INSERT INTO `collect` VALUES ('71', '3', '2', '球状闪电', '2025年01月09日14:50:58', '../../static/books_img/球状闪电.jpg');
INSERT INTO `collect` VALUES ('72', '3', '3', '流浪地球', '2025年01月09日14:51:07', '../../static/books_img/流浪地球.jpg');
INSERT INTO `collect` VALUES ('73', '44', '1', '三体', '2025年01月09日14:51:25', '../../static/books_img/三体.jpg');
INSERT INTO `collect` VALUES ('74', '44', '2', '球状闪电', '2025年01月09日14:51:27', '../../static/books_img/球状闪电.jpg');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `Book_Comment_ID` int(255) NOT NULL AUTO_INCREMENT,
  `Book_ID` int(11) DEFAULT NULL,
  `Book_Name` varchar(255) DEFAULT NULL,
  `Comment_User_Name` varchar(255) DEFAULT NULL,
  `Comment_User_NickName` varchar(255) DEFAULT NULL,
  `Comment_Time` varchar(255) DEFAULT NULL,
  `Comment_Content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Book_Comment_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('1', '1', '三体', '1', '11', '2024年12月23日11:52:10', '非常好看的一本书');
INSERT INTO `comment` VALUES ('3', '1', '三体', '2', '小昊', '2024年12月23日11:52:10', '想看续集');
INSERT INTO `comment` VALUES ('10', '4', '带上她的眼睛', '1', '11', '2024年12月23日13:17:35', '123456');
INSERT INTO `comment` VALUES ('14', '1', '三体', '1', '11', '2024年12月23日13:40:50', '1111');
INSERT INTO `comment` VALUES ('15', '1', '三体', 'pwy', '小叶', '2024年12月23日13:44:06', '我我我');
INSERT INTO `comment` VALUES ('21', '5', '银河帝国', '1', '11', '2024年12月24日17:25:02', '好看');

-- ----------------------------
-- Table structure for discussion
-- ----------------------------
DROP TABLE IF EXISTS `discussion`;
CREATE TABLE `discussion` (
  `Discussion_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Illustrated_ID` int(11) DEFAULT NULL,
  `Illustrated_Name` varchar(255) DEFAULT NULL,
  `Discussion_User_ID` int(11) DEFAULT NULL,
  `Discussion_User_NickName` varchar(255) DEFAULT NULL,
  `Discussion_Parent_ID` int(11) DEFAULT NULL,
  `Discussion_Content` varchar(255) DEFAULT NULL,
  `Discussion_Time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Discussion_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of discussion
-- ----------------------------
INSERT INTO `discussion` VALUES ('1', '1', '三体', '8', '11', '0', '中国科幻之巅', '2024年12月23日11:52:10');
INSERT INTO `discussion` VALUES ('2', '1', '三体', '9', '小昊', '1', '我也这样认为', '2024年12月23日13:52:10');
INSERT INTO `discussion` VALUES ('3', '1', '三体', '10', '3', '1', '对的对的', '2024年12月24日13:52:10');
INSERT INTO `discussion` VALUES ('30', '1', '三体', '9', '小昊', '0', '22', '2024年12月27日18:09:24');
INSERT INTO `discussion` VALUES ('31', '1', '三体', '9', '小昊', '21', '22', '2024年12月27日18:09:26');

-- ----------------------------
-- Table structure for event
-- ----------------------------
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event` (
  `ImportantEvent_ID` int(255) NOT NULL AUTO_INCREMENT,
  `Illustrated_ID` int(255) NOT NULL,
  `Illustrated_Name` varchar(255) DEFAULT NULL,
  `Event_Time` varchar(255) DEFAULT NULL,
  `Event_Description` varchar(255) DEFAULT NULL,
  `Event_Value` int(255) DEFAULT NULL,
  PRIMARY KEY (`ImportantEvent_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of event
-- ----------------------------
INSERT INTO `event` VALUES ('1', '1', '三体', '1967年', '在文化大革命期间，叶文洁是一位天文学家，她因遭遇家庭和社会的双重打击，产生了对人类文明的深深绝望。在一次偶然的机会中，她借助天文台的设备，向太空发出了信号。这一信号不由自主地接触到了三体文明。', '5');
INSERT INTO `event` VALUES ('2', '1', '三体', '2007年', '在地球上，三体游戏作为一个模拟三体星球环境的虚拟现实游戏开始流行。游戏的背后隐藏着三体文明的信息和秘密。玩家在游戏中经历了三体文明的生存困境，并逐渐揭开了三体文明的本质。', '2');
INSERT INTO `event` VALUES ('3', '1', '三体', '2015年', '联合国宣布实施面壁者计划，选定四位面壁者（罗辑、泰勒、雷迪亚兹、希恩斯），他们各自制定对抗三体入侵的战略。', '3');
INSERT INTO `event` VALUES ('4', '1', '三体', '2016年', '体世界向地球发射了两个质子，并将它们展开成二维平面，形成“智子”，用于监视和干扰人类科技发展。', '4');
INSERT INTO `event` VALUES ('5', '1', '三体', '2040年', '罗辑提出了“黑暗森林法则”，并威胁使用按钮摧毁三体星系，迫使三体世界停止对地球的入侵，从而成为人类文明的执剑人。', '3');
INSERT INTO `event` VALUES ('6', '1', '三体', '2278年', '程心接替罗辑成为新的执剑人，她的决策改变了人类与三体文明之间的力量对比，导致了后来的一系列重大变化。', '6');
INSERT INTO `event` VALUES ('7', '1', '三体', '2279年', '来自更高维度的歌者文明降临太阳系，利用二向箔将太阳系降维，使整个太阳系包括地球在内的所有物体都被二维化。', '5');
INSERT INTO `event` VALUES ('8', '1', '三体', '2687年', '在宇宙重启后，程心决定再次尝试重启宇宙，希望能够创造一个更好的未来。', '4');
INSERT INTO `event` VALUES ('10', '1', '三体', '9999年', '地球毁灭，二向箔使地球毁灭', '6');

-- ----------------------------
-- Table structure for history
-- ----------------------------
DROP TABLE IF EXISTS `history`;
CREATE TABLE `history` (
  `History_ID` int(11) NOT NULL AUTO_INCREMENT,
  `User_Name` varchar(255) DEFAULT NULL,
  `Book_ID` int(11) DEFAULT NULL,
  `Book_Name` varchar(255) DEFAULT NULL,
  `Browse_Time` varchar(255) DEFAULT NULL,
  `Img_Url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`History_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of history
-- ----------------------------
INSERT INTO `history` VALUES ('32', '2', '1', '三体', '2025年01月09日14:50:36', '../../static/books_img/三体.jpg');
INSERT INTO `history` VALUES ('33', 'pwy', '4', '带上她的眼睛', '2024年12月23日13:43:59', '../../static/books_img/带上她的眼睛.jpg');
INSERT INTO `history` VALUES ('34', 'pwy', '1', '三体', '2024年12月23日13:44:02', '../../static/books_img/三体.jpg');
INSERT INTO `history` VALUES ('35', 'pwy', '2', '球状闪电', '2024年12月24日18:54:19', '../../static/books_img/球状闪电.jpg');
INSERT INTO `history` VALUES ('39', '1', '2', '球状闪电', '2025年01月09日14:50:07', '../../static/books_img/球状闪电.jpg');
INSERT INTO `history` VALUES ('41', '1', '3', '流浪地球', '2025年01月09日14:50:09', '../../static/books_img/流浪地球.jpg');
INSERT INTO `history` VALUES ('42', '1', '5', '银河帝国', '2025年01月09日14:50:14', '../../static/books_img/银河帝国.jpg');
INSERT INTO `history` VALUES ('43', '1', '4', '带上她的眼睛', '2024年12月29日21:11:38', '../../static/books_img/带上她的眼睛.jpg');
INSERT INTO `history` VALUES ('45', '1', '33', '大大', '2025年01月09日14:50:17', '../../static/books_img/大大.jpg');
INSERT INTO `history` VALUES ('46', '2', '2', '球状闪电', '2025年01月09日14:50:38', '../../static/books_img/球状闪电.jpg');
INSERT INTO `history` VALUES ('47', '2', '3', '流浪地球', '2025年01月09日14:50:40', '../../static/books_img/流浪地球.jpg');
INSERT INTO `history` VALUES ('48', '3', '1', '三体', '2025年01月09日14:50:55', '../../static/books_img/三体.jpg');
INSERT INTO `history` VALUES ('49', '3', '2', '球状闪电', '2025年01月09日14:51:04', '../../static/books_img/球状闪电.jpg');
INSERT INTO `history` VALUES ('50', '3', '3', '流浪地球', '2025年01月09日14:51:07', '../../static/books_img/流浪地球.jpg');
INSERT INTO `history` VALUES ('51', '44', '1', '三体', '2025年01月09日14:51:24', '../../static/books_img/三体.jpg');
INSERT INTO `history` VALUES ('52', '44', '2', '球状闪电', '2025年01月09日14:51:26', '../../static/books_img/球状闪电.jpg');
INSERT INTO `history` VALUES ('53', '1', '1', '三体', '2025年01月17日22:59:32', '../../static/books_img/三体.jpg');

-- ----------------------------
-- Table structure for illustrated
-- ----------------------------
DROP TABLE IF EXISTS `illustrated`;
CREATE TABLE `illustrated` (
  `Illustrated_ID` int(255) NOT NULL AUTO_INCREMENT,
  `Book_ID` int(11) DEFAULT NULL,
  `Book_Name` varchar(255) DEFAULT NULL,
  `Illustrated_Img` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Illustrated_ID`),
  KEY `Book_Name` (`Book_Name`),
  KEY `Book_ID` (`Book_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of illustrated
-- ----------------------------
INSERT INTO `illustrated` VALUES ('1', '1', '三体', '../../static/Illustrated_img/三体.jpg');
INSERT INTO `illustrated` VALUES ('2', '2', '球状闪电', '../../static/Illustrated_img/球状闪电.jpg');
INSERT INTO `illustrated` VALUES ('8', '3', '流浪地球', '../../static/Illustrated_img/流浪地球.jpg');

-- ----------------------------
-- Table structure for relationships
-- ----------------------------
DROP TABLE IF EXISTS `relationships`;
CREATE TABLE `relationships` (
  `Relationship_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Illustrated_ID` int(11) DEFAULT NULL,
  `Illustrated_Name` varchar(255) DEFAULT NULL,
  `From_CharacterID` int(11) DEFAULT NULL,
  `From_Name` varchar(255) DEFAULT NULL,
  `To_CharacterID` int(11) DEFAULT NULL,
  `To_Name` varchar(255) DEFAULT NULL,
  `Relation_Type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Relationship_ID`),
  KEY `relationships_from_characters` (`From_CharacterID`),
  KEY `relationships_to_characters` (`To_CharacterID`),
  KEY `from_Name` (`From_Name`),
  KEY `to_Name` (`To_Name`),
  KEY `illustrated_name` (`Illustrated_Name`),
  KEY `rel_illustrated_id_to_illustrated_id` (`Illustrated_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of relationships
-- ----------------------------
INSERT INTO `relationships` VALUES ('1', '1', '三体', '1', '罗辑', '2', '汪淼', '朋友');
INSERT INTO `relationships` VALUES ('2', '1', '三体', '1', '罗辑', '3', '叶文洁', '师生');
INSERT INTO `relationships` VALUES ('3', '1', '三体', '2', '汪淼', '3', '叶文洁', '朋友');
INSERT INTO `relationships` VALUES ('4', '1', '三体', '4', '史强', '2', '汪淼', '合作');
INSERT INTO `relationships` VALUES ('5', '1', '三体', '4', '史强', '1', '罗辑', '朋友');
INSERT INTO `relationships` VALUES ('6', '1', '三体', '5', '杨卫宁', '3', '叶文洁', '夫妻');
INSERT INTO `relationships` VALUES ('7', '1', '三体', '5', '杨卫宁', '6', '杨冬', '父女');
INSERT INTO `relationships` VALUES ('8', '1', '三体', '3', '叶文洁', '6', '杨冬', '母女');
INSERT INTO `relationships` VALUES ('9', '1', '三体', '6', '杨冬', '1', '罗辑', '同学');
INSERT INTO `relationships` VALUES ('10', '1', '三体', '6', '杨冬', '7', '丁仪', '未婚夫');
INSERT INTO `relationships` VALUES ('11', '1', '三体', '7', '丁仪', '4', '史强', '合作');
INSERT INTO `relationships` VALUES ('15', '1', '三体', '13', '彭炜业', '1', '罗辑', '朋友');

-- ----------------------------
-- Table structure for science
-- ----------------------------
DROP TABLE IF EXISTS `science`;
CREATE TABLE `science` (
  `Science_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Illustrated_Name` varchar(255) DEFAULT NULL,
  `Illustrated_ID` int(11) DEFAULT NULL,
  `Science_Name` varchar(255) DEFAULT NULL,
  `Science_Image` varchar(255) DEFAULT NULL,
  `Science_description` varchar(255) DEFAULT NULL,
  `Science_Rating_Strength` varchar(255) DEFAULT NULL,
  `Science_Rating_Speed` varchar(255) DEFAULT NULL,
  `Science_Rating_Intelligence` varchar(255) DEFAULT NULL,
  `Science_Rating_Durability` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Science_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of science
-- ----------------------------
INSERT INTO `science` VALUES ('1', '三体', '1', '智子', '../../static/science_img/智子.jpg', '一种由强相互作用力材料构成的纳米机器人，可以展开为二维平面，具有强大的计算能力和物理干涉能力。', '5', '5', '5', '3');
INSERT INTO `science` VALUES ('2', '三体', '1', '二向箔', '../../static/science_img/二向箔.jpg', '一种能够将三维空间降维成二维的超级武器，被其影响的物体将被摊平成二维状态。', '5', '3', '1', '5');
INSERT INTO `science` VALUES ('3', '三体', '1', '水滴', '../../static/science_img/水滴.jpg', '水滴Waterdrop ,学名为“强互作用力宇宙探测器”，是由三体人制造的强互作用力材料所制成的宇宙探测器。其表面材料的物质完全由强互作用力凝聚在一起，强度、飞行速度和智能化程度极高。', '5', '5', '4', '5');
INSERT INTO `science` VALUES ('8', '三体', '1', '核弹', '../../static/science_img/核弹.jpg', '原子弹', '5', '4', '2', '1');

-- ----------------------------
-- Table structure for swiper
-- ----------------------------
DROP TABLE IF EXISTS `swiper`;
CREATE TABLE `swiper` (
  `Img_Url` varchar(255) DEFAULT NULL,
  `Book_ID` int(11) DEFAULT NULL,
  `Book_Name` varchar(255) DEFAULT NULL,
  `Swiper_ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`Swiper_ID`),
  KEY `book_name` (`Book_Name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of swiper
-- ----------------------------
INSERT INTO `swiper` VALUES ('../../static/swiper_img/三体.jpg', '1', '三体', '1');
INSERT INTO `swiper` VALUES ('../../static/swiper_img/球状闪电.jpg', '2', '球状闪电', '2');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `User_ID` int(11) NOT NULL AUTO_INCREMENT,
  `User_Name` varchar(255) DEFAULT NULL,
  `PassWord` varchar(255) DEFAULT NULL,
  `NickName` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `AvatarUrl` varchar(255) DEFAULT '',
  PRIMARY KEY (`User_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('8', '1', '$2a$10$7Z0a0crMD7KoJUGR6YEBOehbPgFYkg8cfiGRgxz.swzoI6VKE7Iay', '11', '112345671', 'http://localhost:3000/uploads/1735124074098-12-楚门的世界.jpg');
INSERT INTO `user` VALUES ('9', '2', '$2a$10$cVOBjBtmjcEEwrVLAfALjetFkQ5NARu8HWRz1eYWmKYp.2dYBTpai', '小昊', '2', 'http://localhost:3000/uploads/1732254494434-1-肖申克的救赎.jpg');
INSERT INTO `user` VALUES ('10', '3', '$2a$10$Z1AElnlcMzTpHpVl5.ld1eILpKC.wVWP/qJUKG.86v1lOOTvR1q8G', '3', '3', '');
INSERT INTO `user` VALUES ('11', '44', '$2a$10$..nOxq4rmORWUYWTR43EI.t/RlQXUdLoXuRSWrvSk57lSwM4UoUOG', '44', '44', '');
INSERT INTO `user` VALUES ('12', '5', '$2a$10$xupb1oKcVVuSLSaYnFqS9ee8U3qlqycoR7IWeg3t9VrJhkO.KA7g6', '5', '5', '');
INSERT INTO `user` VALUES ('13', '11', '$2a$10$u7bm9wplLCguRokR9FYC/.hIBwqhs.nuBhnzctnIIRVFFbUuf8SSq', '11', '11', '');
INSERT INTO `user` VALUES ('14', 'pwy', '$2a$10$h40WIx71zITgwmadnZgjKeSMZ12AxJpsA0Oqn6oH2JT0a1.4rRfCq', '小叶', '1753052114@qq.com', '');
INSERT INTO `user` VALUES ('15', '0', '$2a$10$NO7aSLpDEhQhmSZ/1WAbt.btUFLpFYEnkqy1UniyLQDVXMIRiZ7i2', '0', '0', '');

-- ----------------------------
-- Table structure for worldview
-- ----------------------------
DROP TABLE IF EXISTS `worldview`;
CREATE TABLE `worldview` (
  `Worldview_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Illustrated_ID` int(11) DEFAULT NULL,
  `Illustrated_Name` varchar(255) DEFAULT NULL,
  `Worldview_Title` varchar(255) DEFAULT NULL,
  `Worldview_Description` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`Worldview_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of worldview
-- ----------------------------
INSERT INTO `worldview` VALUES ('1', '1', '三体', '宇宙中的“黑暗森林”法则', '在《三体》第二部《黑暗森林》中，提出了著名的“黑暗森林”法则。这一法则描述了宇宙中各个文明之间的关系。由于资源有限，任何文明都无法知道其他文明的真实意图，因此，每个文明都必须保持隐秘，并通过消灭潜在的威胁来保证自身的生存。宇宙就像一个黑暗森林，各个文明就像猎人，他们必须保持沉默并时刻警惕，因为任何暴露自己位置的行为都可能招来致命的攻击。');
INSERT INTO `worldview` VALUES ('2', '1', '三体', '三体文明与人类的对立', '三体文明的生存困境：三体文明的星球存在极端的不稳定性，其三颗太阳造成了极端的气候变化和周期性的文明灭绝，因此三体文明长期处于生死存亡的边缘。为了生存，三体人对地球发起了侵略计划，企图夺取地球作为新的家园。\r\n人类与三体的冲突：三体文明的到来促使人类在科技、道德和哲学层面进行剧烈反思。人类在面对外星威胁时的脆弱与无力感，成为整部作品的一个核心主题。');
INSERT INTO `worldview` VALUES ('3', '1', '三体', '宇宙社会学与“低维空间”的概念', '低维空间：三体文明在科技上非常发达，能够将整个星球的维度压缩，创造低维空间。这种技术的应用展示了高级文明在物理学和宇宙学上的突破。低维空间的概念不仅展示了三体文明的科技优势，还引发了对维度、时空、物理定律的深刻讨论。\r\n宇宙社会学：在《三体》三部曲中，宇宙被描绘为一个充满不稳定和威胁的“社会”，其中不同文明之间的互动充满了猜忌和冲突。宇宙中的文明并非和平共处，而是相互竞争，甚至存在通过消灭其他文明来获得生存空间的现象。');
INSERT INTO `worldview` VALUES ('4', '1', '三体', '“三体问题”与物理学的思考', '三体问题：书名中的“三体”指的是经典的物理问题——三体问题，即三个物体在引力作用下的运动无法用简单的数学公式精确预测，因其轨道极为复杂。三体问题的无解性象征着宇宙的混乱和不可预测性，也反映了人类对宇宙探索中的极限理解。三体文明的星球处于不稳定的三体系统中，这一物理问题直接影响了三体文明的存亡与行为。\r\n物理学的极限：《三体》三部曲对物理学的理解做出了极大的拓展，涉及量子通信、反物质、黑洞、维度压缩等高级科技，探索了人类在面对宇宙中极限现象时的科学和哲学反应。');
INSERT INTO `worldview` VALUES ('5', '1', '三体', '宇宙中的“文明竞争”', '竞争与自保：在《三体》世界观中，不同的文明竞争资源，甚至竞争生存空间。任何高等文明都会在与其他文明接触时，选择保护自己，而不是简单地进行合作。正因为宇宙是一个“黑暗森林”，文明之间几乎没有合作的可能，更多的是竞争、消灭或隐匿。\r\n文明的生命周期：宇宙中的高级文明是短暂而脆弱的，科技进步虽然能够带来巨大的优势，但也意味着文明的寿命是有限的。《三体》通过三体文明和地球文明的对比，探讨了文明在极端环境下如何求生，如何在宇宙中的大环境中自我保护。');
DROP TRIGGER IF EXISTS `author_name`;
DELIMITER ;;
CREATE TRIGGER `author_name` AFTER UPDATE ON `author` FOR EACH ROW BEGIN
    -- 检查是否真的改变了 Author字段
    IF OLD.Author_Name <> NEW.Author_Name THEN
        -- 更新 swiper 表中对应的记录
        UPDATE book
        SET Author = NEW.Author_Name
        WHERE Author_ID = NEW.Author_ID;
    END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `img_url`;
DELIMITER ;;
CREATE TRIGGER `img_url` AFTER UPDATE ON `book` FOR EACH ROW BEGIN
    -- 检查是否真的改变了 Img_Url 字段
    IF OLD.Img_Url <> NEW.Img_Url THEN
        -- 更新 swiper 表中对应的记录
        UPDATE swiper
        SET Img_Url = NEW.Img_Url
        WHERE Book_ID = NEW.Book_ID;

        UPDATE collect
        SET Img_Url = NEW.Img_Url
        WHERE Book_ID = NEW.Book_ID;

        UPDATE history
        SET Img_Url = NEW.Img_Url
        WHERE Book_ID = NEW.Book_ID;
    END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `book_name`;
DELIMITER ;;
CREATE TRIGGER `book_name` AFTER UPDATE ON `book` FOR EACH ROW BEGIN
    -- 检查是否真的改变了 book_Name 字段
    IF OLD.Book_Name <> NEW.Book_Name THEN
        -- 更新 swiper 表中对应的记录
        UPDATE swiper
        SET Book_Name = NEW.Book_Name
        WHERE Book_ID = NEW.Book_ID;

        UPDATE characters
        SET Illustrated_Name= NEW.Book_Name
        WHERE Illustrated_ID= NEW.Book_ID;

        UPDATE discussion
        SET Illustrated_Name= NEW.Book_Name
        WHERE Illustrated_ID= NEW.Book_ID;

        UPDATE event
        SET Illustrated_Name= NEW.Book_Name
        WHERE Illustrated_ID= NEW.Book_ID;

        UPDATE history
        SET Book_Name = NEW.Book_Name
        WHERE Book_ID = NEW.Book_ID;

        UPDATE collect
        SET Book_Name = NEW.Book_Name
        WHERE Book_ID = NEW.Book_ID;

        UPDATE comment
        SET Book_Name = NEW.Book_Name
        WHERE Book_ID = NEW.Book_ID;


        UPDATE illustrated
        SET Book_Name = NEW.Book_Name
        WHERE Book_ID = NEW.Book_ID;
    END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `book_id`;
DELIMITER ;;
CREATE TRIGGER `book_id` AFTER UPDATE ON `book` FOR EACH ROW BEGIN
    -- 检查是否真的改变了 Book_ID 字段
    IF OLD.Book_ID <> NEW.Book_ID THEN
        -- 确保新的 Book_ID 在 swiper 表中是唯一的
        IF NOT EXISTS (SELECT 1 FROM swiper WHERE Book_ID = NEW.Book_ID) THEN
            -- 更新 swiper 表中对应的记录
            UPDATE swiper
            SET Book_ID = NEW.Book_ID
            WHERE Book_ID = OLD.Book_ID;

            UPDATE collect
            SET Book_ID = NEW.Book_ID
            WHERE Book_ID = OLD.Book_ID;

            UPDATE comment
            SET Book_ID = NEW.Book_ID
            WHERE Book_ID = OLD.Book_ID;

            UPDATE illustrated
            SET Book_ID = NEW.Book_ID
            WHERE Book_ID = OLD.Book_ID;

            UPDATE history
            SET Book_ID = NEW.Book_ID
            WHERE Book_ID = OLD.Book_ID;
            
            -- 如果存在依赖关系或其他约束，这里可能需要额外的逻辑来处理
        ELSE
            -- 如果新 Book_ID 已经存在于 swiper 表中，可以抛出一个错误或者采取其他措施
            SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Cannot update Book_ID because the new ID already exists in swiper table.';
        END IF;
    END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `illustrated_name`;
DELIMITER ;;
CREATE TRIGGER `illustrated_name` AFTER UPDATE ON `illustrated` FOR EACH ROW BEGIN 
             UPDATE relationships
             SET Illustrated_Name = NEW. Book_Name
             WHERE Illustrated_ID = OLD. Illustrated_ID;

             UPDATE science
             SET Illustrated_Name = NEW. Book_Name
             WHERE Illustrated_ID = OLD. Illustrated_ID;

             UPDATE worldview
             SET Illustrated_Name = NEW. Book_Name
             WHERE Illustrated_ID = OLD. Illustrated_ID;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `illustrated_id`;
DELIMITER ;;
CREATE TRIGGER `illustrated_id` AFTER UPDATE ON `illustrated` FOR EACH ROW BEGIN 
             UPDATE characters
             SET Illustrated_ID = NEW.Illustrated_ID 
             WHERE Illustrated_ID = OLD.Illustrated_ID ;

             UPDATE discussion
             SET Illustrated_ID = NEW.Illustrated_ID
             WHERE Illustrated_ID = OLD.Illustrated_ID;


             UPDATE event
             SET Illustrated_ID = NEW. Illustrated_ID
             WHERE Illustrated_ID = OLD. Illustrated_ID;

             UPDATE relationships
             SET Illustrated_ID = NEW. Illustrated_ID
             WHERE Illustrated_ID = OLD. Illustrated_ID;

             UPDATE science
             SET Illustrated_ID = NEW. Illustrated_ID
             WHERE Illustrated_ID = OLD. Illustrated_ID;

             UPDATE worldview
             SET Illustrated_ID = NEW. Illustrated_ID
             WHERE Illustrated_ID = OLD. Illustrated_ID;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `user_id`;
DELIMITER ;;
CREATE TRIGGER `user_id` AFTER UPDATE ON `user` FOR EACH ROW BEGIN
    -- 检查是否真的改变了 User_ID字段
    IF OLD.User_ID <> NEW.User_ID THEN
        -- 更新 discussion表中对应的记录
        UPDATE discussion
        SET discussion_User_ID = NEW.User_ID
        WHERE discussion_User_ID = OLD.User_ID ;

    END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `nick_name`;
DELIMITER ;;
CREATE TRIGGER `nick_name` AFTER UPDATE ON `user` FOR EACH ROW BEGIN
    -- 检查是否真的改变了 NickName 字段
    IF OLD.NickName <> NEW.NickName THEN
        -- 更新 comment表中对应的记录
        UPDATE comment
        SET Comment_User_NickName = NEW.NickName
        WHERE Comment_User_NickName = OLD.NickName ;

        UPDATE discussion
        SET Discussion_User_NickName = NEW.NickName
        WHERE Discussion_User_NickName = OLD.NickName ;


    END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `user_name`;
DELIMITER ;;
CREATE TRIGGER `user_name` AFTER UPDATE ON `user` FOR EACH ROW BEGIN
    -- 检查是否真的改变了 user_Name 字段
    IF OLD.User_Name <> NEW.User_Name THEN
        -- 更新 collect表中对应的记录
        UPDATE collect
        SET User_Name = NEW.User_Name
        WHERE User_Name = OLD.User_Name ;

        UPDATE history
        SET User_Name = NEW.User_Name
        WHERE User_Name = OLD.User_Name ;

        UPDATE comment
        SET Comment_User_Name = NEW.User_Name
        WHERE Comment_User_Name = OLD.User_Name ;

    END IF;
END
;;
DELIMITER ;
