package com.liz.service;

import com.liz.model.Billion;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.sql.Timestamp;
import java.util.Date;

/**
 * Created by lizhou on 2017年07月23日 19时36分
 */
public class BillionServiceImplTest extends BaseUnitTest{
    @Autowired
    private BillionService billionService;

    @Test
    public void batchInsertTest(){
        Billion billion =  new Billion();


        int count = 0 ;
        String ip = "";
        Long aStart,bStart,cStart,dStart;
        aStart  = System.currentTimeMillis();
        for(int a = 0 ;a <= 255;a++){
            bStart = System.currentTimeMillis();
            for(int b = 0 ;b < 255;b++){
                cStart = System.currentTimeMillis();
                for(int c = 0 ;c < 255;c++){
                    dStart = System.currentTimeMillis();
                    for(int d = 0 ;d < 255;d++){
                        if( b < 21){
                            continue;
                        }
                        if(b == 21 && c < 46){
                            continue;
                        }
                        if(b == 21 && c == 46 && d < 89){
                            continue;
                        }
                        ip = a + "." + b + "." + c + "." + d;
                        System.out.println("ip=" + ip);
                        billion.setIp(ip);
                        billion.setUrl("http://business.sohu.com/20170723/n503490890.shtml");
                        billion.setTitle("贾跃亭所代表的圈钱时代结束了");
                        String content = "　　有人说贾老板有情怀有冒险精神。在规则面前，在契约精神面前，情怀又值几个钱？\n" +
                                "\n" +
                                "　　我们不做墙倒众人推，不做事后诸葛亮，单看他的阶层逆袭悲剧，我用两个字概括：错配。\n" +
                                "\n" +
                                "　　还是华为的任正非清醒，“不能去炫耀锄头忘了种地! ”\n" +
                                "\n" +
                                "　　贾老板的情怀值几个钱？\n" +
                                "\n" +
                                "　　本周，万达被限贷了，乐视被追债了。\n" +
                                "\n" +
                                "　　对于贾跃亭人们纷纷站队。“挺贾派”最看不惯吃瓜群众嘲笑一个有梦想的企业家。“倒贾派”一如既往认为乐视就是一场庞氏骗局，一个故事接一个故事，坑了供货商、乐视会员、员工，坑了多家银行、基金、私募、股民。就凭一句道歉和空口承诺，竟然还能迎来纷纷赞扬，市场经济的契约精神去哪儿了？\n" +
                                "\n" +
                                "　　依我看，贾跃亭身上有三重身份：创业者、股东、经理人。\n" +
                                "\n" +
                                "　　第一，作为创业者值得同情，这没什么好调侃的。第二，作为股东，自己花自己钱，愿赌服输，也没什么可说的。第三，作为上市公司老总，你可得为股民和投资人负责呀。你牛逼一把，让我们买单，这不合适吧？\n" +
                                "\n" +
                                "　　有人说贾老板有情怀有冒险精神。在规则面前，在契约精神面前，情怀又值几个钱？\n" +
                                "\n" +
                                "　　老贾，人家喊你回家还债！他现在能做的唯一正确的事就是赶紧回来，而不是躲在美国，如果还想保住乐视这块牌子的话。\n" +
                                "\n" +
                                "　　贾老板的“错配”人生坑了多少人？\n" +
                                "\n" +
                                "　　贾跃亭代表小城青年的逆袭悲剧，从中我读出了“错配”两字。\n" +
                                "\n" +
                                "　　乐视七年融资729亿元，烧钱1500亿元。“眼看他起高楼，眼看他晒PPT，眼看他楼塌了……”我们不做墙倒众人推，不做事后诸葛亮，单看他的阶层逆袭悲剧，我用两个字概括：错配。\n" +
                                "\n" +
                                "　　第一，逆袭参照系错配。\n" +
                                "\n" +
                                "　　2011年乔布斯去世，国家领导人就发问：“中国为什么出不了乔布斯？”老贾可能心里说，“我来试试。”\n" +
                                "\n" +
                                "　　乔布斯名言：“谁说我不去问用户?我常问用户，每天早上起来我就对着镜子问用户：你要什么?”他有众多头衔如商业艺术家、设计美学大师、科技趋势大师、细节偏执狂……乔帮主的偏执叫现实扭曲力场。贾布斯的现实扭曲力显然不够，因为你不但想法要牛，产品更得牛。凭发布会上砸烂一部苹果手机就牛了吗？\n" +
                                "\n" +
                                "　　2016年3月，在一年一度的IT领袖论坛上，首次出席该峰会的贾跃亭质问马云“为什么总是你们BAT的天下？”他是多么渴望与BAT大佬平起平坐啊。现在看来，冲击BAT没成功，当贾布斯更变成了一个笑话。\n" +
                                "\n" +
                                "　　第二，逆袭路径错配。\n" +
                                "\n" +
                                "　　真正的小镇青年应该像雷军或者是华为余承东那样的，经过魔鬼式的高考训练步步为营，先把人做扎实了，先把产品做好，再去谋求业界的一席之地。\n" +
                                "\n" +
                                "　　放弃手机而决定进军汽车，简单的手机没做好，转而做更为复杂的汽车，这个路径肯定不对，如果不是疯了的话。你凭什么1都没做好就跳到3？\n" +
                                "\n" +
                                "　　第三，逆袭资源错配。\n" +
                                "\n" +
                                "　　老贾从一个农家子弟到小城青年到大城市，要想一步登天难度可想而知。贾跃亭的疑似政商勾结，一段时期去国未归，虽然最后解禁，但留下污点。当初晋商就败在官商勾结啊。民企跨越式发展时，离不开与权力打交道，此时更应万分小心。\n" +
                                "\n" +
                                "　　过去三十多年来，中国在商业模式上以美国为师，做大，上市，圈钱，再冲世界500强。企业产品和服务做得怎么样先放一边，先圈钱扩张要紧。这种劣质的模仿危害巨大，巨大到企业家都没心思踏踏实实做产品了，玩弄金融工具倒是乐此不疲。还是华为的任正非清醒，“不能去炫耀锄头忘了种地! ”金融工具就是锄头，锄头只是工具！\n" +
                                "\n" +
                                "　　“一万年太久，只争朝夕”，中国人这样的急躁病好像一直挥之不去。\n" +
                                "\n" +
                                "　　人总是要清醒的。贾跃亭所代表的圈钱时代结束了。批量造富的时代，天上掉馅饼的时代，上市造首富的时代，都一去不复返了。\n" +
                                "\n" +
                                "　　这是好事，资本市场用残酷的方式让一些人归零。你想发大财，对不起，时机不对，路径不对，资源不对。\n" +
                                "\n" +
                                "　　贾老板对阶层晋级有什么启示呢，是步步为营好，还是一万年太久、只争朝夕好?\n" +
                                "\n" +
                                "　　未来二三年内，恐怕你只能从一个个小目标开始了。\n" +
                                "\n" +
                                "　　欢迎订阅我的《个人晋级二十条》。打实基础，再向上攀登。";

                        billion.setContent(content);
                        billion.setCreator("lizhou");
                        billion.setCreateTime(new Timestamp(System.currentTimeMillis()));
                        int countResult = billionService.save(billion);
                        if(countResult > 0 ){
                            count ++ ;
                        }
                    }

                    System.out.println("完成一轮d层循环！,耗时：" + (System.currentTimeMillis() - dStart) + "毫秒");
                }
                System.out.println("完成一轮c层循环！,耗时：" + (System.currentTimeMillis() - cStart) + "毫秒");
            }
            System.out.println("完成一轮b层循环！,耗时：" + (System.currentTimeMillis() - bStart) + "毫秒");
        }
        System.out.println("完成一轮a层循环！,耗时：" + (System.currentTimeMillis() - aStart) + "毫秒");




    }
}

