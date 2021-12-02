<%--
  Created by IntelliJ IDEA.
  User: 黄渝斌
  Date: 2021/10/2
  Time: 17:50
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="/common/path.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>智慧物流系统</title>

    <!--    <link rel="stylesheet" type="text/css" href="css/commonstyle.css" />-->
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <!--        <script src='https://w101.ttkefu.com/k/?fid=2B1ICB8'  charset=utf-8></script>-->

    <script type="text/javascript" src="static/jquery-3.5.1/jquery-3.5.1.min.js"></script>

    <style>
        /*使固定在地步的页脚不遮挡其他内容*/
        /*body { padding-bottom: 70px; }*/

        /*轮播图片尺寸*/
        .carousel-inner .item img {
            width: 100%;
            height: 100%;
        }


        /*如果你不用超大屏幕，你可以这样设置让两边的留白失效*/
        .container-fluid{
            padding-right: 0;
            padding-left: 0;
        }
        body{
            overflow-x:hidden ;
        }

        /*让导航条上下和别的没有距离*/
        .navbar{

            margin: 0;
            padding: 0;
        }
        .navbar .row {
            background-color: white;
        }

        /*#footer{*/
        /*    background-image: url("images/buu.png");*/
        /*    background-size: 100% 100%;*/
        /*}*/

        #footer{
            background-color: aliceblue;
        }


        .content,#registerBackground,#loginBackground{
            background-image: url("images/login.jpg");

        }

        .content div .col-md-6,.col-md-8,.col-md-4{

            margin-top: 100px;margin-bottom: 100px;
            padding: 100px;
            background-color: rgba(255,255,255,0.8)
        }


        #logistics{
            background-image: url("images/query_1.jpg");
        }

        #logistics div .col-md-4{
            margin-top: 100px;
            margin-bottom: 100px;
            background-color: rgba(255,255,255,0.8)
        }

        .siteContent hr:first-child{
            margin-top: 0;
        }

        #order .col-md-4{
            margin: 0;
            padding: 0;
        }


        .carousel-caption{
            padding-bottom: 20%;
        }

        .modal-content{
            margin-top:25%;
            background-color: rgba(255,255,255,0.8)
        }


        #learning{
            background-image: none;
        }

        #learning .col-md-6{
            margin-top: 50px;
            margin-bottom: 50px;
            background-color: whitesmoke;
            background-image: none;
        }

        @keyframes carton_1 {
            0%{left: 0}
            50%{left: 10px}
            100%{left: 0}
        }

        /*支持该后缀的浏览器*/
        @-webkit-keyframes carton_1{
            0%{left: 0}
            50%{left: 10px}
            100%{left: 0}
        }

        .indication{
            /*引用动画*/
            animation: carton_1;
            -webkit-animation: carton_1;
            /*多少秒之内完成*/
            animation-duration:0.5s;
            /*演示时间infinite表示永久*/
            animation-iteration-count:infinite;
            position: relative;
            background-color: white;
            margin-left: 10px;
            margin-right: 10px;

        }

        .card{
            margin-bottom: 150px;
        }



        body{
            position: relative;
        }

        #attNav_1{
            right: 0;
            width: 200px;
            background-color:honeydew;
        }



    </style>
    <script>
        const callbackBtn = [];
        callbackBtn[0]="#sideshow";
        //鼠标经过时弹出菜单,因为每个下拉列表的类名都相同，所以要用document对象
        $(document).on("mouseover",".dropdown",function () {
            $(this).addClass('open');
        })
        $(document).on("mouseout",".dropdown",function () {
            $(this).removeClass('open');
        })

        //表单清空
        function clearForm(btn){
            //如何没有form表单子元素，就返回
            // if(!$("#id:has(标签名)").length)
            if(!($(btn+":has(form)").length)){return false}
            $(btn+" form")[0].reset();
            $(btn+" form").find("input").parent().removeClass("has-success");
            $(btn+" form").find("input").parent().removeClass("has-error");
            let span=$(btn+" form").find("input").parent().find("span");
            if (span.hasClass("help-block")){
                $(span).find("help-block").text("");
            }


        }



        $(document).on("click",".skip",function () {
            let _this=$(this);
            $.ajax({
                url:"${basePath}/logistics",
                type:"post",
                success:function () {

                    /*这里我们必须获取target属性。
                    * 这个target属性是保存href的临时属性
                    * 因为下面的二级导航，会更改href属性的值，
                    * 我们点击了一次二级导航，要是想再点击一次，
                    * 肯定是要获取先前的href属性的。
                    * 这里的判断要特别注意的是，第一次进来的时候，target属性值是空的
                    * */

                    /*下面的选择器不能this，虽然skip与skip-2都在同一个li上
                    * 但是skip是对应一级导航存在，skip-2是对应二级导航存在
                    * 有些一级导航没有二级导航
                    * */

                    let target=$(_this).find("a").attr("data-tar");

                    if (target!==undefined){
                        $(".skip-2").find("a").prop("href",target);
                    }

                    let length=callbackBtn.length;
                    let btn=$(_this).find("a").attr("href");
                    callbackBtn[length]=btn;
                    alert(btn)
                    alert(length)
                    clearForm(btn);
                    displayCss();

                    // displayActive();
                    let liBtn=$(_this).parents().find("li");

                    if (liBtn.hasClass("active")){
                        $(liBtn).removeClass("active");
                    }

                    //这里因为本身自己也带有.content,所以要将自己的找到，然后将这个样式去掉
                    let this_btn=$(_this).find("a").attr("href");
                    $(this_btn).css("display","");

                    // addActive();

                    $(this).parent().parent().addClass("active");
                    $(this).addClass("active")

                    //找到当前注册还是登录的最后一个a，表示是免费注册还是免费登录
                    //但是值得注意的是，在这里不能写下面的的代码，因为无论是登录和注册的页面里的免费登录和免费注册的点击都是加载而存在的
                    //但登录和注册的页面就是因为点击而出现的
                    //模拟一个错误：点击登录,出现免费注册，点击免费注册，进入注册页面，这里的进入是通过点击了登录后，再点击免费注册进去的
                    // 也就是说，你进到的注册页面里，没有点击过注册页面就进去了，所以该点击进去的注册页面的其他点击会失效
                    // let abtn=$(this_btn).find("p").find("a:last");
                    // let pbtn=$(abtn).attr("href");
                    // $(abtn).click(function () {
                    //     displayCss();
                    //     $(pbtn).css("display","");
                    // });

                    skip_2(_this,length,target);
                }

            });



        })

        function skip_2(btn,lt,tar) {
            //如果有二级导航，如学习空间
            if ($(btn).hasClass("skip-2")) {
                let this_id = $(btn).attr("id");
                /*截取字符串，表示从第一位开始，截取到最后*/
                let id = this_id.substring(1, this_id.length);
                let _id = "#"+id;

                /*
                * attr和prop这两个方法虽然都可以更改属性的值
                * 但是前者适合于自定义的属性，后者适合于已存在的属性
                * 否则是出现一些莫名其妙的错误
                * */

                /*
                * 该data-tar属性只能被记录一次，不然会重复赋值
                * */
                if(tar===undefined){
                    $(btn).find("a").attr("data-tar",$(btn).find("a").attr("href"));
                }
                $(btn).find("a").prop("href",_id);
                callbackBtn[lt]=_id;
                // alert(_id)
            }

        }

        //给每个页面的其他a标签添加单击事件
        $(document).on("click",".otherBtn",function () {
            let btn=$(this).attr("href");

            // alert(btn)
            clearForm(btn);
            displayCss();

            $(btn).css("display","");

            /*
            * 这里的otherBtn类也存在于返回上一级的标签里
            * 而callback类也在返回上一级标签里
            * 但是除了返回上一级的标签，其他标签就没有callback这个类了
            * 我们要保存那些没有callback这个类的含有otherBtn这个类的页面（因为这里我们规定，是可以返回的）
            * 而如果有callback这个类的otherBtn，我们又保存了其btn，就会造成点击返回，回到原地
            * */
            if (!$(this).hasClass("callback")){
                let length=callbackBtn.length;
                // alert(length)
                callbackBtn[length]=btn;
                //    得到上一个位置，数组保存的页面的href属性
                let lastBtn=callbackBtn[length-1];
                // alert(lastBtn)
                //    根据其href属性，凭借出奇li标签里的id属性
                let _li_id = lastBtn.substring(1, lastBtn.length);
                let li_id = "#"+"_"+_li_id;
                //    如果其是二级导航
                if ($(li_id).hasClass("skip-2")){
                    //    将当前数组位置的值改变，这样如果有二级导航后，返回上一级就不会出现一直是同一个地方的情况
                    /*
                    * 也就是说，如果我们在二级导航中，点击的其他按钮，我们就要将数组原先的保存
                    * 换成我们从这个二级导航中哪里点击的，这样下次返回就会返回原来点击的地方
                    * 如果不这样做，因为之前的数组保存的是，我们从正导航栏上面点击而来的页面，保存的永远都是一个id值
                    *
                    * */
                    callbackBtn[length-1]="#"+$(this).attr("data-a-id");
                    //    将保存进去的标签的子a标签的data-tar属性赋值，保存操作displayCss的id
                    let id="#"+"_"+$(this).attr("data-a-id");

                    let data_tar=$(id).find("a").attr("data-tar");

                    let li_data_tar=$(li_id).find("a").attr("data-tar");
                    $(id).find("a").attr("data-tar",li_data_tar);
                }
            }
        })

        $(document).on("click",".callback",function () {
            //拿到上一个页面保存的id属性的值
            let backBtn=callbackBtn[callbackBtn.length-2];
            // alert(backBtn)
            clearForm(backBtn);
            //拿到这个页面保存的id属性，然后根据id属性的值，得到这个页面的父母标签，让其active的类消失
            /*
            * 但是要记住，这个id的属性值是页面的属性值，而不是拥有active类的标签的id值
            * 这个id的值在拥有active类的标签里的是href的值
            * */
            // alert(callbackBtn[callbackBtn.length-1])
            let parentBtn=$("li a[href="+callbackBtn[callbackBtn.length-1]+"]");

            //拿到要跳转的页面的导航栏的标签，让其class 为active
            /*截取字符串，表示从第一位开始，截取到最后*/
            let _li_id = backBtn.substring(1, backBtn.length);
            let li_id = "#"+"_"+_li_id;
            let learning=backBtn;
            if ($(li_id).hasClass("skip-2")){
                learning=$(li_id).find("a").attr("data-tar");

            }
            let backParentsBtn=$("li a[href="+backBtn+"]");
            $(this).attr("href",backBtn);
            // alert(backBtn)
            displayCss();
            $(parentBtn).parents().find("li").removeClass("active");
            $(backParentsBtn).parent().parent().parent().addClass("active");
            $(backParentsBtn).parent().addClass("active");
            $(li_id).addClass("active")
            $(learning).css("display","");

            callbackBtn.length--;
        })

        function displayCss() {
            //将幻灯片的css去掉，这里不统一幻灯片的class是因为，首页要用
            $(".sideshow").css("display","none");

            //将带有.content 类的css去掉
            $(".content").css("display","none");

        }


        //    城市下拉选择
        try{
            var sf=[];
            sf[0]=["北京市","东城|西城|崇文|宣武|朝阳|丰台|石景山|海淀|门头沟|房山|通州|顺义|昌平|大兴|平谷|怀柔|密云|延庆"];
            sf[1]=["上海市","黄浦|卢湾|徐汇|长宁|静安|普陀|闸北|虹口|杨浦|闵行|宝山|嘉定|浦东|金山|松江|青浦|南汇|奉贤|崇明"];
            sf[2] = ["天津市","和平|东丽|河东|西青|河西|津南|南开|北辰|河北|武清|红挢|塘沽|汉沽|大港|宁河|静海|宝坻|蓟县"];
            sf[3] = ["重庆市","万州|涪陵|渝中|大渡口|江北|沙坪坝|九龙坡|南岸|北碚|万盛|双挢|渝北|巴南|黔江|长寿|綦江|潼南|铜梁 |大足|荣昌|壁山|梁平|城口|丰都|垫江|武隆|忠县|开县|云阳|奉节|巫山|巫溪|石柱|秀山|酉阳|彭水|江津|合川|永川|南川"];
            sf[4] = ["河北省","石家庄|邯郸|邢台|保定|张家口|承德|廊坊|唐山|秦皇岛|沧州|衡水"];
            sf[5] = ["山西省","太原|大同|阳泉|长治|晋城|朔州|吕梁|忻州|晋中|临汾|运城"];
            sf[6] = ["内蒙古自治区","呼和浩特|包头|乌海|赤峰|呼伦贝尔盟|阿拉善盟|哲里木盟|兴安盟|乌兰察布盟|锡林郭勒盟|巴彦淖尔盟|伊克昭盟"];
            sf[7] = ["辽宁省","沈阳|大连|鞍山|抚顺|本溪|丹东|锦州|营口|阜新|辽阳|盘锦|铁岭|朝阳|葫芦岛"];
            sf[8] = ["吉林省","长春|吉林|四平|辽源|通化|白山|松原|白城|延边"];
            sf[9] = ["黑龙江省","哈尔滨|齐齐哈尔|牡丹江|佳木斯|大庆|绥化|鹤岗|鸡西|黑河|双鸭山|伊春|七台河|大兴安岭"];
            sf[10] = ["江苏省","南京|镇江|苏州|南通|扬州|盐城|徐州|连云港|常州|无锡|宿迁|泰州|淮安"];
            sf[11] = ["浙江省","杭州|宁波|温州|嘉兴|湖州|绍兴|金华|衢州|舟山|台州|丽水"];
            sf[12] = ["安徽省","合肥|芜湖|蚌埠|马鞍山|淮北|铜陵|安庆|黄山|滁州|宿州|池州|淮南|巢湖|阜阳|六安|宣城|亳州"];
            sf[13] = ["福建省","福州|厦门|莆田|三明|泉州|漳州|南平|龙岩|宁德"];
            sf[14] = ["江西省","南昌市|景德镇|九江|鹰潭|萍乡|新馀|赣州|吉安|宜春|抚州|上饶"];
            sf[15] = ["山东省","济南|青岛|淄博|枣庄|东营|烟台|潍坊|济宁|泰安|威海|日照|莱芜|临沂|德州|聊城|滨州|菏泽"];
            sf[16] = ["河南省","郑州|开封|洛阳|平顶山|安阳|鹤壁|新乡|焦作|濮阳|许昌|漯河|三门峡|南阳|商丘|信阳|周口|驻马店|济源"];
            sf[17] = ["湖北省","武汉|宜昌|荆州|襄樊|黄石|荆门|黄冈|十堰|恩施|潜江|天门|仙桃|随州|咸宁|孝感|鄂州"];
            sf[18] = ["湖南省","长沙|常德|株洲|湘潭|衡阳|岳阳|邵阳|益阳|娄底|怀化|郴州|永州|湘西|张家界"];
            sf[19] = ["广东省","广州|深圳|珠海|汕头|东莞|中山|佛山|韶关|江门|湛江|茂名|肇庆|惠州|梅州|汕尾|河源|阳江|清远|潮州|揭阳|云浮"];
            sf[20] = ["广西壮族自治区","南宁|柳州|桂林|梧州|北海|防城港|钦州|贵港|玉林|南宁地区|柳州地区|贺州|百色|河池"];
            sf[21] = ["海南省","海口|三亚"];
            sf[22] = ["四川省","成都|绵阳|德阳|自贡|攀枝花|广元|内江|乐山|南充|宜宾|广安|达川|雅安|眉山|甘孜|凉山|泸州"];
            sf[23] = ["贵州省","贵阳|六盘水|遵义|安顺|铜仁|黔西南|毕节|黔东南|黔南"];
            sf[24] = ["云南省","昆明|大理|曲靖|玉溪|昭通|楚雄|红河|文山|思茅|西双版纳|保山|德宏|丽江|怒江|迪庆|临沧"];
            sf[25] = ["西藏自治区","拉萨|日喀则|山南|林芝|昌都|阿里|那曲"];
            sf[26] = ["陕西省","西安|宝鸡|咸阳|铜川|渭南|延安|榆林|汉中|安康|商洛"];
            sf[27] = ["甘肃省","兰州|嘉峪关|金昌|白银|天水|酒泉|张掖|武威|定西|陇南|平凉|庆阳|临夏|甘南"];
            sf[28] = ["宁夏回族自治区","银川|石嘴山|吴忠|固原"];
            sf[29] = ["青海省","西宁|海东|海南|海北|黄南|玉树|果洛|海西"];
            sf[30] = ["新疆维吾尔族自治区","乌鲁木齐|石河子|克拉玛依|伊犁|巴音郭勒|昌吉|克孜勒苏柯尔克孜|博尔塔拉|吐鲁番|哈密|喀什|和田|阿克苏"];
            sf[31] = ["香港特别行政区","香港特别行政区"];
            sf[32] = ["澳门特别行政区","澳门特别行政区"];
            sf[33] = ["台湾省","台北|高雄|台中|台南|屏东|南投|云林|新竹|彰化|苗栗|嘉义|花莲|桃园|宜兰|基隆|台东|金门|马祖|澎湖"];
            sf[34] = ["其它","北美洲|南美洲|亚洲|非洲|欧洲|大洋洲"];
        }catch(e){
            alert(e);
        }
        $(document).ready(function(e) {
            $(".Address").change(function(){
                try{
                    var pro=$(this).val();
                    var i,j,tmpcity=[];
                    for(i=0;i<sf.length;i++){
                        if(pro===sf[i][0].toString()){
                            tmpcity=sf[i][1].split("|");
                            $(".City").html("");
                            for(j=0;j<tmpcity.length;j++){
                                $(".City").append("<option>"+tmpcity[j]+"</option>");
                            }
                        }
                    }
                }catch(e){
                    alert(e);
                }
            });
        });


        //    获取寄件方式

        $(document).on("blur","#toMethod",function () {
            let jQuery = $("#toMethod").find("option:selected").text();
            if (jQuery==="上门"){
                $("#toTimeDiv").css("display","");
            }else {
                $("#toTimeDiv").css("display","none")
            }
        })

        //    获取慈善机构
        $(document).on("blur",".charityInstitution",function () {
            let j = $(this).find("option:selected").text();
            let btn=$(".charityInstitutionAddress");
            if (j !== "北京联合大学慈善机构") {
                $(btn).css("display", "none");

            } else {
                $(btn).css("display", "");
                $(btn).find("option").each(function () {
                    if ($(this).text()==="北四环东路9号"){
                        $(this).prop("selected",true);
                    }else{
                        $(this).attr("disabled","disabled");
                    }
                });

                // if (){
                //     $(btn_1).prop("selected",true);
                // }
            }
        })

        //    为网点的内容添加点击事件，让其可以滑动，还可以淡入淡出
        $(document).on("click",".siteHeader",function () {
            let span=$(this).find("span");
            if (span.attr("class")==="glyphicon glyphicon-chevron-down"){
                $(span).attr("class","glyphicon glyphicon-chevron-right");
            }else {
                $(span).attr("class","glyphicon glyphicon-chevron-down");
            }
            let pbtn=$(this).parent().find("div");
            $(pbtn).slideToggle("slow");
        })


        $(function () {
            $('[data-toggle="popover"]').popover();

        })


        $(document).on("click",".input-group-addon",function () {

            let btn = $(this).find("span");
            /*
            * 下面不能用类选择器，直接获取weight就行了，
            * 如果用类选择器，所有是这个类名的input标签都会生效，
            * 而这些input标签的id属性肯定是不同的，所以要用id属性来赋值
            * */
            let id = "#" + $(this).parent().find("input").attr("id");

            btn.each(function () {
                if (btn.hasClass("glyphicon-plus")){
                    if ($(id).val()===""){
                        $(id).prop("value","1");
                    }else {
                        let i=parseInt($(id).prop("value"));
                        i=i+1;
                        $(id).prop("value",i);
                    }
                }
                if (btn.hasClass("glyphicon-minus")){
                    if ($(id).val()===""||$(id).val()==="0"){
                        $(id).prop("value","0");
                    }else {
                        let i=parseInt($(id).prop("value"));
                        i=i-1;
                        $(id).prop("value",i);
                    }
                }
            });
        })

        //赋值改变的时候最好不要用attr，attr拿到的值是自定义的，可能会出现bug
        //prop修改值根据标签里的默认属性
        $(document).on("blur",".weight",function () {
            const pattern = /^[0-9]*[1-9][0-9]*$/;
            if (!pattern.test(this.value)){
                this.value=1;
            }
            //这里不能用this，涉及多个同样的类要用类名，不然有的数据会失效
            //而且，如同上面的单击事件所说一样，这里也要用id选中。
            let id = $(this).parent().find("input").attr("id");
            $("#"+id).prop("value",this.value)
        })

        //    弹出捐赠模态框
        $(document).on("click",".donate",function () {
            let headerText=$(this).text();
            let myModal=$("#myModal");
            myModal.find(".modal-header").find(".modal-title").text(headerText).addClass("text-center");
            myModal.modal({
                //防止点击背景就消失
                backdrop:"static"
            });
        })

        //    ----下面进行前端的校验，主要是有用户名，密码，邮箱，电话的校验----------------------------------------------------

        //    由于大部分校验都相同，可以打包成一个方法，ex代表传入的正则表达式，id代表inputid值
        //    alert为警告文字
        function Checked(ex,id,alert) {
            let value=$(id).val();
            let span=$(id).parent().find("span");
            if (value===""){
                $(id).parent().removeClass("has-error");
                $(id).parent().removeClass("has-success");
                span.text("");
                return  false;
            }
            if (!ex.test(value)) {
                if (span.hasClass("help-block")){
                    // 要加has-error 警告信息类，加载器被包括的div中
                    $(id).parent().addClass("has-error");
                    span.text(alert);
                }
                return false;
            }else{
                $(id).parent().removeClass("has-error");
                $(id).parent().addClass("has-success");
                span.text("");
            }
        }

        //    注册用户名和登录用户名校验,可以用id属性绑定，也可以用class属性绑定，
        //    但估计id属性会更好，因为类属性可能会造成多个input共享的bug
        $(document).on("blur","#username,#registerUsername",function () {
            let ex=/^[a-zA-Z0-9_-]{4,16}$/;
            let alertText="用户名必须4-16位，可以字母数字下划线"
            Checked(ex,this,alertText);
        })

        //    密码校验
        $(document).on("blur","#confirmPassword,#password,#registerPassword",function () {
            let ex=/^\S*(?=\S{6,})(?=\S*\d)(?=\S*[A-Z])(?=\S*[a-z])(?=\S*[!@#$%^&*? ])\S*$/;
            let alertText="最少六位，包括大小写字母，数字，特殊字符";
            Checked(ex,this,alertText);
        })

        //    邮箱校验
        $(document).on("blur","#registerEmail",function () {
            let ex=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
            let alertText="请输入带@的正确邮箱格式";
            Checked(ex,this,alertText);
        })
        //    电话校验
        $(document).on("blur","#customPhone,#registerPhone,#userphone,#queryPhone,#toPhone",function () {
            let ex=/^(?:(?:\+|00)86)?1\d{10}$/;
            let alertText="请输入正确的手机号码";
            Checked(ex,this,alertText);
        })


        /*--------------ajax请求------------*/
        // $(document).on("click","")

    </script>

</head>
<body data-spy="scroll" data-target="#attachNav" data-offset="300"  >


<div class="container-fluid" id="head">

    <div class="row">
        <div class="col-md-12">

            <img style="width: 100%;height: 100%;" src="images/buu.png" alt="北京联合大学">
        </div>
    </div>

</div>

<nav class="navbar navbar-default " role="navigation" id="mainNav" >
    <div class="container-fluid ">
        <div class="row">
            <div class="col-md-12">
                <div class=" navbar-header" style="margin-left: 10%;margin-right: 5%">
                    <button  type="button" class="navbar-toggle " data-toggle="collapse"
                             data-target="#example-navbar-collapse">
                        <span class="sr-only">切换导航</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">智慧物流系统</a>
                </div>
                <div class=" collapse navbar-collapse " id="example-navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li class="active skip"><a href="#sideshow">首页</a></li>
                        <li><a href="https://www.buu.edu.cn/" target="_blank">社区</a></li>

                        <li class="dropdown" >
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                消费者服务
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="skip"><a href="#toLogistics" >国内寄件</a></li>
                                <li class="skip"><a href="#logistics" >物流查询</a></li>
                                <li class="skip"><a href="#querySite" >网点查询</a></li>
                                <li class="skip"><a href="#order" data-tar="">订单</a></li>
                                <li class="divider"></li>
                                <li class="skip"><a href="#sideshowCharity">公益捐赠</a> </li>
                                <li class="divider"></li>
                                <li><a href="https://w101.ttkefu.com/k/linkurl/?t=2B1ICB8" target="_blank">客服</a></li>
                            </ul>
                        </li>

                        <li class="dropdown" >
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                学习空间
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="skip skip-2" id="_card_1"><a href="#learning">如何寄件</a></li>
                                <li class="skip skip-2" id="_card_2"><a href="#learning">如何查询</a></li>
                                <li class="skip skip-2" id="_card_3"><a href="#learning">如何查询网点</a></li>
                                <li class="skip skip-2" id="_card_4"><a href="#learning">如何查询订单</a></li>
                                <li  class="skip skip-2" id="_card_5"><a href="#learning">如何维权</a></li>
                                <li class="divider"></li>
                                <li><a href="#">校园学习</a></li>
                            </ul>
                        </li>

                        <li class="dropdown" >
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                冷链中心
                                <b class="caret"></b>
                            </a>
                            <ul class="dropdown-menu">
                                <li class="disabled"><a href="#">待开发</a></li>
                            </ul>
                        </li>
                    </ul>

                    <ul class="nav navbar-nav navbar-right">
                        <li class="breadcrumb-item skip"><a href="#loginBackground">登录</a></li>
                        <li class="breadcrumb-item skip"><a href="#registerBackground">注册</a></li>
                        <li class="dropdown breadcrumb-item " >
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                                <span class="glyphicon glyphicon-user"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#">个人中心</a></li>
                                <li><a href="#">后台管理系统</a> </li>
                                <li class="divider"></li>
                                <li><a href="#">投诉？</a></li>
                                <li><a href="#">建议</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>

</nav>

<!--轮播效果-->
<div class="container-fluid sideshow" id="sideshow">
    <div class="row" >
        <div  class="col-md-12  col-lg-12 bg-success">
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="./images/listbox_1.png" alt="...">
                        <div class="carousel-caption">
                            ...
                        </div>
                    </div>
                    <div class="item">
                        <img src="./images/listbox_2.png" alt="...">
                        <div class="carousel-caption">
                            ...
                        </div>
                    </div>
                    <div class="item">
                        <img src="./images/listbox_3.png" alt="...">
                        <div class="carousel-caption">
                            ...
                        </div>
                    </div>

                </div>

                <!-- Controls -->
                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    </div>
</div>

<!--登陆效果-->
<div  class="container-fluid content" id="loginBackground" style="display: none;">
    <div class="row" >
        <div class="col-md-3"></div>
        <div class="col-md-6" >
            <form class="form-horizontal">
                <div class="form-group">
                    <div class="col-sm-12">
                        <h1 class="text-center">用户名登录</h1>
                        <a class="callback otherBtn" href="">返回上一级</a>
                    </div>
                </div>
                <div class="form-group">
                    <label for="username" class="col-sm-2 control-label"><span class="glyphicon glyphicon-user"></span></label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="username" name="username" placeholder="用户名">
                        <span class="help-block"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="password" class="col-sm-2 control-label"><span class="glyphicon glyphicon-lock"></span> </label>
                    <div class="col-sm-8">
                        <input type="password" class="form-control" id="password" name="password" placeholder="密码">
                        <span class="help-block"></span>
                    </div>
                </div>

                <div class="form-group">
                    <label for="checkedcode" class="col-sm-2 control-label"><span class="glyphicon glyphicon-check"></span> </label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="checkedcode" name="checkedcode" placeholder="验证码">
                        <span class="help-block"></span>
                    </div>
                    <div class="col-sm-4">
                        <img src="" alt="验证码"><br/>
                        <h6><a href="#">验证码不清晰？更换换一张</a> </h6>
                    </div>
                </div>
                <div class="form-group">
                    <label for="login" class="col-sm-2 control-label"></label>
                    <div class="col-sm-8">
                        <button  type="submit" class="btn btn-success col-sm-12" id="login" name="login">登陆</button>
                    </div>
                </div>


                <div class="form-group">
                    <label  class="col-sm-2 control-label"></label>
                    <div class="col-sm-8">
                        <p style="float: right"><a class="otherBtn">忘记密码？</a>&nbsp;<a class="otherBtn">忘记账号？</a>&nbsp;<a class="otherBtn" href="#registerBackground">免费注册</a></p>
                    </div>
                </div>

            </form>
        </div>
        <div class="col-md-3"></div>
    </div>
</div>


<!--注册-->
<div  class="container-fluid content" id="registerBackground" style="display: none;">
    <div class="row" >
        <div class="col-md-3"></div>
        <div class="col-md-6" >
            <form class="form-horizontal">
                <div class="form-group">
                    <div class="col-sm-12">
                        <h1 class="text-center">注册</h1>
                        <a class="callback otherBtn" href="">返回上一级</a>
                    </div>
                </div>
                <div class="form-group">
                    <label for="registerUsername" class="col-sm-2 control-label"><span class="glyphicon glyphicon-user"></span></label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="registerUsername" name="registerUsername" placeholder="用户名">
                        <span class="help-block"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="registerPassword" class="col-sm-2 control-label"><span class="glyphicon glyphicon-lock"></span> </label>
                    <div class="col-sm-8">
                        <input type="password" class="form-control" id="registerPassword" name="password" placeholder="密码">
                        <span class="help-block"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="confirmPassword" class="col-sm-2 control-label"><span class="glyphicon glyphicon-lock"></span> </label>
                    <div class="col-sm-8">
                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="确认密码">
                        <span class="help-block"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="registerEmail" class="col-sm-2 control-label"><span class="glyphicon glyphicon-envelope"></span> </label>
                    <div class="col-sm-8">
                        <input type="email" class="form-control" id="registerEmail" name="registerEmail" placeholder="邮箱">
                        <span class="help-block"></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="registerPhone" class="col-sm-2 control-label"><span class="glyphicon glyphicon-phone"></span> </label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="registerPhone" name="phone" placeholder="电话">
                        <span class="help-block"></span>
                    </div>
                </div>

                <div class="form-group">
                    <label for="registerCheckedcode" class="col-sm-2 control-label"><span class="glyphicon glyphicon-check"></span></label>
                    <div class="col-sm-4">
                        <input type="text" class="form-control" id="registerCheckedcode" name="checkedcode" placeholder="验证码">
                        <span class="help-block"></span>
                    </div>
                    <div class="col-sm-4">
                        <img src="" alt="验证码"/>
                        <h6><a href="#">验证码看不清？再次发送</a> </h6>
                    </div>
                </div>
                <div class="form-group">
                    <label for="register" class="col-sm-2 control-label"></label>
                    <div class="col-sm-8">
                        <button  type="submit" class="btn btn-success col-sm-12" id="register" name="register">注册</button>
                    </div>
                </div>


                <div class="form-group">
                    <label  class="col-sm-2 control-label"></label>
                    <div class="col-sm-8">
                        <p style="float: right">&nbsp;<a class="otherBtn" href="#loginBackground">免费登录</a></p>
                    </div>
                </div>

            </form>
        </div>
        <div class="col-md-3"></div>
    </div>
</div>

<!--不登录查询快递-->
<div  class="container-fluid content" id="logistics" style="display: none;" >

    <div class="row" >
        <div class="col-md-3"></div>

        <div class="col-md-6" >
            <h1 class="text-center">物流查询</h1>
            <a class="callback otherBtn" href="">返回上一级</a>
            <div style="float: right;">
                <a class="otherBtn" href="#toLogistics">物流寄件</a>&nbsp;&nbsp;
                <a class="otherBtn" href="#order">订单管理</a>&nbsp;&nbsp;
                <a href="">售后</a>
            </div>

            <form class="form-horizontal " style="margin: 20px">
                <div class="form-group">
                    <label for="queryByNumber"></label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="queryByNumber" name="queryByNumber" placeholder="请输入订单号">
                    </div>
                    <div class="col-sm-6">
                        <button class="btn btn-success col-sm-6" id="queryByNumberBtn" name="queryByNumberBtn">订单查询</button>
                    </div>
                </div>

                <div class="form-group">
                    <label for="queryByPhone"></label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="queryByPhone" name="queryByPhone" placeholder="请输入手机号">
                        <span class="help-block"></span>
                    </div>
                    <div class="col-sm-6">
                        <button class="btn btn-success col-sm-6" id="queryByIdBtn" name="queryByPhoneBtn">手机号查询</button>
                    </div>
                </div>


                <div class="form-group">
                    <div class="col-sm-12">
                        <p >&nbsp;查询不出来？请<a class="otherBtn" href="#loginBackground">登录</a>试试</p>
                    </div>
                </div>

            </form>

        </div>
        <div class="col-md-3"></div>
    </div>
</div>

<!--物流配送-->
<div class="container-fluid content" id="toLogistics" style="display:none;">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <h1 class="text-center">物流寄送</h1>
            <a class="callback otherBtn" href="">返回上一级</a>
            <div style="float: right;">
                <a class="otherBtn" href="#logistics">物流查询</a>&nbsp;&nbsp;
                <a class="otherBtn" href="#order">订单管理</a>&nbsp;&nbsp;
                <a href="">售后</a>
            </div>

            <form class="form-horizontal " id="lp" style="margin: 20px">
                <div class="form-group">
                    <label for="toAddress" class="col-sm-4 control-label">收件人地址:</label>
                    <div class="col-sm-8">
                        <select class="form-control Address" id="toAddress" name="toAddress">
                            <option>-请选择-</option>
                            <option>北京市</option>
                            <option>上海市</option>
                            <option>天津市</option>
                            <option>重庆市</option>
                            <option>河北省</option>
                            <option>山西省</option>
                            <option>内蒙古自治区</option>
                            <option>辽宁省</option>
                            <option>吉林省</option>
                            <option>黑龙江省</option>
                            <option>江苏省</option>
                            <option>浙江省</option>
                            <option>安徽省</option>
                            <option>福建省</option>
                            <option>江西省</option>
                            <option>山东省</option>
                            <option>河南省</option>
                            <option>湖北省</option>
                            <option>湖南省</option>
                            <option>广东省</option>
                            <option>广西壮族自治区</option>
                            <option>海南省</option>
                            <option>四川省</option>
                            <option>贵州省</option>
                            <option>云南省</option>
                            <option>西藏自治区</option>
                            <option>陕西省</option>
                            <option>甘肃省</option>
                            <option>宁夏回族自治区</option>
                            <option>青海省</option>
                            <option>新疆维吾尔族自治区</option>
                            <option>香港特别行政区</option>
                            <option>澳门特别行政区</option>
                            <option>台湾省</option>
                            <option>其它</option>
                        </select>
                        <label for="toCity"></label>
                        <select class="form-control City" id="toCity" name="toCity">
                            <option>城市</option>
                        </select>
                        <label for="toDetailAddress"></label>
                        <input style="margin-top: 5px;" type="text" class="form-control Detail" id="toDetailAddress" name="toDetailAddress" placeholder="详细地址">
                    </div>
                </div>

                <div class="form-group">
                    <label for="toName" class="col-sm-4 control-label">收件人姓名:</label>
                    <div class="col-sm-8">
                        <input  type="text" class="form-control col-sm-12" id="toName" name="toName" placeholder="收件人姓名"/>
                        <span class="help-block"></span>
                    </div>
                </div>

                <div class="form-group">
                    <label for="toPhone" class="col-sm-4 control-label">收件人电话:</label>
                    <div class="col-sm-8">
                        <input  type="text" class="form-control col-sm-12" id="toPhone" name="toPhone" placeholder="寄件人电话"/>
                        <span class="help-block"></span>
                    </div>
                </div>
                <hr>

                <div class="form-group">
                    <label for="address" class="col-sm-4 control-label">寄件人地址:</label>
                    <div class="col-sm-8">
                        <select class="form-control" id="address" name="address">
                            <option>-请选择-</option>
                            <option>北京市</option>
                            <option>上海市</option>
                            <option>天津市</option>
                            <option>重庆市</option>
                            <option>河北省</option>
                            <option>山西省</option>
                            <option>内蒙古自治区</option>
                            <option>辽宁省</option>
                            <option>吉林省</option>
                            <option>黑龙江省</option>
                            <option>江苏省</option>
                            <option>浙江省</option>
                            <option>安徽省</option>
                            <option>福建省</option>
                            <option>江西省</option>
                            <option>山东省</option>
                            <option>河南省</option>
                            <option>湖北省</option>
                            <option>湖南省</option>
                            <option>广东省</option>
                            <option>广西壮族自治区</option>
                            <option>海南省</option>
                            <option>四川省</option>
                            <option>贵州省</option>
                            <option>云南省</option>
                            <option>西藏自治区</option>
                            <option>陕西省</option>
                            <option>甘肃省</option>
                            <option>宁夏回族自治区</option>
                            <option>青海省</option>
                            <option>新疆维吾尔族自治区</option>
                            <option>香港特别行政区</option>
                            <option>澳门特别行政区</option>
                            <option>台湾省</option>
                            <option>其它</option>
                        </select>
                        <label for="city"></label>
                        <select class="form-control" id="city" name="city">
                            <option>城市</option>
                        </select>
                        <label for="detailAddress"></label>
                        <input style="margin-top: 5px;" type="text" class="form-control" id="detailAddress" name="detailAddress" placeholder="详细地址">
                        <span class="help-block"></span>
                    </div>
                </div>

                <div class="form-group"  >
                    <label for="customName" class="col-sm-4 control-label">寄件人姓名:</label>
                    <div class="col-sm-8">
                        <input class="form-control col-sm-12" id="customName" name="customName" placeholder="您的姓名"/>
                        <span class="help-block"></span>
                    </div>
                </div>

                <div class="form-group"  >
                    <label for="customPhone" class="col-sm-4 control-label">电话号码:</label>
                    <div class="col-sm-8">
                        <input class="form-control col-sm-12" id="customPhone" name="customPhone" placeholder="电话号码"/>
                        <span class="help-block"></span>
                    </div>
                </div>

                <div class="form-group">
                    <label for="toMethod" class="col-sm-4 control-label">寄件方式:</label>
                    <div class="col-sm-8">
                        <select class="form-control" id="toMethod" name="toMethod">
                            <option>服务点自寄</option>
                            <option>上门</option>
                        </select>
                    </div>
                </div>

                <!--折叠的选项-->
                <div class="form-group" id="toTimeDiv" style="display:none;">
                    <label for="toTime" class="col-sm-4 control-label">上门时间:</label>
                    <div class="col-sm-8">
                        <select class="form-control" id="toTime" name="toTime">
                            <option value="2">两小时之内</option>
                            <option value="4">四小时内</option>
                            <option value="5">6小时内</option>
                            <option disabled="disabled">其他时间请致电</option>
                        </select>
                    </div>
                </div>



                <div class="form-group"  >
                    <label for="weight" class="col-sm-4 control-label">物品重量:</label>
                    <div class="col-sm-8">
                        <div class="input-group">
                            <span class="input-group-addon ">
                                <span class="glyphicon glyphicon-plus"></span>
                            </span>
                            <input type="text" class="form-control col-sm-8 weight" id="weight" name="weight" placeholder="1/kg/请输入正整数" />
                            <span class="input-group-addon ">
                                <span class="glyphicon glyphicon-minus"></span>
                            </span>
                            <!--                            <span class="help-block"></span>-->
                        </div>

                    </div>
                </div>

                <div class="form-group"  >
                    <label for="kinds" class="col-sm-4 control-label">物品种类:</label>
                    <div class="col-sm-8">
                        <select class="form-control" id="kinds" name="kinds">
                            <option value="1">正常</option>
                            <option value="0">易碎</option>
                            <option disabled="disabled">其他种类请联系最近网点</option>
                        </select>
                    </div>
                </div>

                <div class="form-group" style="margin-bottom: 10px" >
                    <label class="col-sm-4"></label>
                    <div class="col-sm-8">
                        <button  type="submit" class="btn btn-success col-sm-12" id="sender" name="sender">寄件</button>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-4"></label>
                    <div class="col-sm-8">
                        <p >&nbsp;想要更好地查询物流？请<a class="otherBtn" href="#loginBackground">登录</a>试试</p>
                    </div>
                </div>

            </form>
        </div>
        <div class="col-md-3"></div>
    </div>
</div>

<!--网点查询-->
<div class="container-fluid content" id="querySite" style="display: none;">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <h1 class="text-center">网点查询</h1>
            <a class="callback otherBtn" href="">返回上一级</a>

            <form class="form-horizontal " style="margin-top: 20px" >
                <div class="form-group">
                    <label for="site"></label>
                    <div class="col-sm-8">
                        <input type="text" class="form-control" id="site" name="site" placeholder="网点关键字">
                        <span class="help-block"></span>
                    </div>
                    <div class="col-sm-4">
                        <button type="submit" class="btn btn-success col-sm-12 glyphicon glyphicon-search" id="queryBySite" name="queryBySite"></button>
                    </div>
                </div>
            </form>

            <div class="row" style="margin: 0;padding: 0;">
                <div class="col-md-6" style="margin: 0;padding: 0;">
                    <h5 class="text-center siteHeader" >全部<span class="glyphicon glyphicon-chevron-right"></span></h5>
                    <div class="siteContent" style="display: none;">
                        <hr>
                        <p class="text-center"><a  data-placement="left"  data-toggle="popover" data-trigger="hover" title="地址：" data-content="北四环东路97号；电话：18277486571">北四环校区校园营业站</a></p>
                        <hr>
                        <p class="text-center">更多合作中...</p>
                    </div>
                </div>
                <div class="col-md-6" style="margin: 0;padding: 0; ">
                    <h5 class="text-center siteHeader" id="siteHeader_2">近邻宝<span class="glyphicon glyphicon-chevron-right"></span></h5>
                    <div class="siteContent" style="display: none;">
                        <hr>
                        <p class="text-center">南院一号柜二号柜足球场旁</p>
                        <hr>
                        <p class="text-center">北院三号柜北院食堂旁</p>
                        <hr>
                        <p class="text-center">更多待合作中</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3"></div>
    </div>

</div>

<!--订单管理-->
<div class="container-fluid content"  id="order" style="display: none;">
    <div class="row">
        <div class="col-md-2"></div>
        <div class="col-md-8">
            <h1 class="text-center">订单管理</h1>
            <a class="callback otherBtn" href="">返回上一级</a>
            <div class="row" >
                <div class="col-md-4"  >
                    <h4 class="text-center siteHeader">进行中<span class="glyphicon glyphicon-chevron-right"></span></h4>
                    <div class="col-md-12 text-center siteContent" style="display: none">
                        <hr >
                        <a href="">2021/9/24 13:51</a>
                        <hr>
                    </div>
                </div>
                <div class="col-md-4" >
                    <h4 class="text-center siteHeader">已完成 <span class="glyphicon glyphicon-chevron-right"></span></h4>
                    <div class="col-md-12 text-center siteContent" style="display: none" >
                        <hr >
                        <p><a href="">2021/9/24 13:51</a></p>
                        <hr>
                    </div>
                </div>
                <div class="col-md-4" >
                    <h4 class="text-center siteHeader">已取消<span class="glyphicon glyphicon-chevron-right"></span></h4>
                </div>
            </div>
        </div>
        <div class="col-md-2"></div>
    </div>

</div>

<!--公益捐赠-->

<div class="container-fluid content" id="sideshowCharity" style="display: none;">
    <div class="row" >
        <div  class="col-md-12  col-lg-12 bg-success">
            <div id="carousel-example-generic-charity" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic-charity" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic-charity" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic-charity" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="./images/book_1.jpg" alt="...">
                        <div class="carousel-caption " >
                            <div class="page-header"  >
                                <h1>抓住世界秘密的核心</h1>
                            </div>
                            <a class="btn  btn-default btn-lg donate" href="#" role="button" data-toggle="modal" >捐赠图书</a>
                        </div>
                    </div>
                    <div class="modal fade" id="myModal">
                        <div class="modal-dialog">
                            <div class="modal-content">

                                <!-- 模态框头部 -->
                                <div class="modal-header">
                                    <h4 class="modal-title text-center">捐赠图书</h4>
                                </div>

                                <!-- 模态框主体 -->
                                <div class="modal-body">
                                    <form class="form-horizontal ">
                                        <div class="form-group">
                                            <label for="charityAddress" class="col-sm-4 control-label">寄件人地址:</label>
                                            <div class="col-sm-7">
                                                <select class="form-control Address" id="charityAddress" name="charityAddress">
                                                    <option>-请选择-</option>
                                                    <option>北京市</option>
                                                    <option>上海市</option>
                                                    <option>天津市</option>
                                                    <option>重庆市</option>
                                                    <option>河北省</option>
                                                    <option>山西省</option>
                                                    <option>内蒙古自治区</option>
                                                    <option>辽宁省</option>
                                                    <option>吉林省</option>
                                                    <option>黑龙江省</option>
                                                    <option>江苏省</option>
                                                    <option>浙江省</option>
                                                    <option>安徽省</option>
                                                    <option>福建省</option>
                                                    <option>江西省</option>
                                                    <option>山东省</option>
                                                    <option>河南省</option>
                                                    <option>湖北省</option>
                                                    <option>湖南省</option>
                                                    <option>广东省</option>
                                                    <option>广西壮族自治区</option>
                                                    <option>海南省</option>
                                                    <option>四川省</option>
                                                    <option>贵州省</option>
                                                    <option>云南省</option>
                                                    <option>西藏自治区</option>
                                                    <option>陕西省</option>
                                                    <option>甘肃省</option>
                                                    <option>宁夏回族自治区</option>
                                                    <option>青海省</option>
                                                    <option>新疆维吾尔族自治区</option>
                                                    <option>香港特别行政区</option>
                                                    <option>澳门特别行政区</option>
                                                    <option>台湾省</option>
                                                    <option>其它</option>
                                                </select>
                                                <label for="charityCity"></label>
                                                <select class="form-control City" id="charityCity" name="charityCity">
                                                    <option>城市</option>
                                                </select>
                                                <label for="charityDetailAddress"></label>
                                                <input style="margin-top: 5px;" type="text" class="form-control" id="charityDetailAddress" name="charityDetailAddress" placeholder="详细地址">
                                                <span class="help-block"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="charityName" class="col-sm-4 control-label">寄件人姓名:</label>
                                            <div class="col-sm-7">
                                                <input type="text" class="form-control" id="charityName" name="charityName" placeholder="姓名">
                                                <span class="help-block"></span>
                                            </div>

                                        </div>
                                        <div class="form-group">
                                            <label for="charityPhone" class="col-sm-4 control-label">电话:</label>
                                            <div class="col-sm-7">
                                                <input type="text" class="form-control" id="charityPhone" name="charityPhone" placeholder="电话">
                                                <span class="help-block"></span>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="charityInstitution" class="col-sm-4 control-label">慈善机构:</label>
                                            <div class="col-sm-7">
                                                <select class="form-control charityInstitution" id="charityInstitution" name="charityInstitution">
                                                    <option>--请选择--</option>
                                                    <option>北京联合大学慈善机构</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group charityInstitutionAddress" id="charityInstitutionAddressDiv" style="display: none;">
                                            <label for="charityInstitutionAddress" class="col-sm-4 control-label">机构地址:</label>
                                            <div class="col-sm-7">
                                                <select class="form-control " id="charityInstitutionAddress" name="charityInstitutionAddress">
                                                    <option>北四环东路97号</option>
                                                    <option>北四环东路98号</option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="form-group">

                                            <label for="charityWeight" class="col-sm-4 control-label">物品重量:</label>
                                            <div class="col-sm-7">
                                                <div class="input-group">
                                                    <span class="input-group-addon ">
                                                        <span class="glyphicon glyphicon-plus"></span>
                                                    </span>
                                                    <input type="text" class="form-control col-sm-8 weight" id="charityWeight" name="charityWeight" placeholder="1/kg/请输入正整数" />
                                                    <span class="input-group-addon ">
                                                        <span class="glyphicon glyphicon-minus"></span>
                                                    </span>
                                                </div>

                                            </div>
                                        </div>
                                    </form>
                                </div>

                                <!-- 模态框底部 -->
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">关闭</button>
                                    <button type="submit" class="btn btn-primary btn-success">捐赠</button>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="item">
                        <img src="./images/cloth_1.jpg" alt="...">
                        <div class="carousel-caption">
                            <div class="page-header"  >
                                <h1>披挂遮风挡雨的布衣</h1>
                            </div>
                            <a class="btn  btn-default btn-lg donate" href="#" role="button">捐赠衣物</a>
                        </div>
                    </div>

                </div>

                <!-- Controls -->
                <a class="left carousel-control" href="#carousel-example-generic-charity" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic-charity" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>
        </div>
    </div>
</div>

<!--学习空间-->
<div class="container-fluid content" id="learning" style="display: none;" >
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6 runListening"   >
            <div class="row" >
                <div class="panel panel-primary card" id="card_1" >
                    <div class="panel-heading">
                        <h3 class="panel-title text-center">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box" viewBox="0 0 16 16">
                                <path d="M8.186 1.113a.5.5 0 0 0-.372 0L1.846 3.5 8 5.961 14.154 3.5 8.186 1.113zM15 4.239l-6.5 2.6v7.922l6.5-2.6V4.24zM7.5 14.762V6.838L1 4.239v7.923l6.5 2.6zM7.443.184a1.5 1.5 0 0 1 1.114 0l7.129 2.852A.5.5 0 0 1 16 3.5v8.662a1 1 0 0 1-.629.928l-7.185 2.874a.5.5 0 0 1-.372 0L.63 13.09a1 1 0 0 1-.63-.928V3.5a.5.5 0 0 1 .314-.464L7.443.184z"></path>
                            </svg>
                            如何寄件？
                        </h3>
                    </div>
                    <div class="panel-body text-center">
                        <p>
                            1.鼠标滑动到消费者服务，点击<span class="glyphicon glyphicon-hand-right indication"></span>
                            <a class="otherBtn" data-a-id="card_1" href="#toLogistics">国内寄件</a>
                        </p>
                        <p>2.正确填写相关信息</p>
                        <p>3.确认信息</p>
                        <p>4.付款，寄件</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="panel panel-success card" id="card_2">
                    <div class="panel-heading">
                        <h3 class="panel-title text-center">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box" viewBox="0 0 16 16">
                                <path d="M8.186 1.113a.5.5 0 0 0-.372 0L1.846 3.5 8 5.961 14.154 3.5 8.186 1.113zM15 4.239l-6.5 2.6v7.922l6.5-2.6V4.24zM7.5 14.762V6.838L1 4.239v7.923l6.5 2.6zM7.443.184a1.5 1.5 0 0 1 1.114 0l7.129 2.852A.5.5 0 0 1 16 3.5v8.662a1 1 0 0 1-.629.928l-7.185 2.874a.5.5 0 0 1-.372 0L.63 13.09a1 1 0 0 1-.63-.928V3.5a.5.5 0 0 1 .314-.464L7.443.184z"/>
                            </svg>
                            如何查询快递？
                        </h3>
                    </div>
                    <div class="panel-body text-center">
                        <p>
                            1.鼠标滑动到消费者服务，点击<span class="glyphicon glyphicon-hand-right indication"></span>
                            <a class="otherBtn" data-a-id="card_2" href="#logistics">快递查询</a>
                        </p>
                        <p>2.正确填写相关信息</p>
                        <p>3.确认信息</p>
                        <p>4.付款，寄件</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="panel panel-success card" id="card_3">
                    <div class="panel-heading">
                        <h3 class="panel-title text-center">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box" viewBox="0 0 16 16">
                                <path d="M8.186 1.113a.5.5 0 0 0-.372 0L1.846 3.5 8 5.961 14.154 3.5 8.186 1.113zM15 4.239l-6.5 2.6v7.922l6.5-2.6V4.24zM7.5 14.762V6.838L1 4.239v7.923l6.5 2.6zM7.443.184a1.5 1.5 0 0 1 1.114 0l7.129 2.852A.5.5 0 0 1 16 3.5v8.662a1 1 0 0 1-.629.928l-7.185 2.874a.5.5 0 0 1-.372 0L.63 13.09a1 1 0 0 1-.63-.928V3.5a.5.5 0 0 1 .314-.464L7.443.184z"></path>
                            </svg>
                            如何查询网点？
                        </h3>
                    </div>
                    <div class="panel-body text-center">
                        <p>
                            1.鼠标滑动到消费者服务，点击<span class="glyphicon glyphicon-hand-right indication"></span>
                            <a class="otherBtn" data-a-id="card_3" href="#querySite">网点查询</a>
                        </p>
                        <p>2.可搜索网点</p>
                        <p>3.可点击查看全部网点</p>
                        <p>4.鼠标滑动至网点可显示网点信息</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="panel panel-warning card" id="card_4">
                    <div class="panel-heading">
                        <h3 class="panel-title text-center">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box" viewBox="0 0 16 16">
                                <path d="M8.186 1.113a.5.5 0 0 0-.372 0L1.846 3.5 8 5.961 14.154 3.5 8.186 1.113zM15 4.239l-6.5 2.6v7.922l6.5-2.6V4.24zM7.5 14.762V6.838L1 4.239v7.923l6.5 2.6zM7.443.184a1.5 1.5 0 0 1 1.114 0l7.129 2.852A.5.5 0 0 1 16 3.5v8.662a1 1 0 0 1-.629.928l-7.185 2.874a.5.5 0 0 1-.372 0L.63 13.09a1 1 0 0 1-.63-.928V3.5a.5.5 0 0 1 .314-.464L7.443.184z"></path>
                            </svg>
                            如何查询订单？
                        </h3>
                    </div>
                    <div class="panel-body text-center">
                        <p>
                            1.鼠标滑动到消费者服务，点击<span class="glyphicon glyphicon-hand-right indication"></span>
                            <a class="otherBtn" data-a-id="card_4" href="#order">订单查询</a>
                        </p>
                        <p>2.可查看进行中，已完成，已取消的历史订单</p>
                        <p>3.点击订单可查看订单信息</p>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="panel panel-danger card" id="card_5">
                    <div class="panel-heading">
                        <h3 class="panel-title text-center">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-box" viewBox="0 0 16 16">
                                <path d="M8.186 1.113a.5.5 0 0 0-.372 0L1.846 3.5 8 5.961 14.154 3.5 8.186 1.113zM15 4.239l-6.5 2.6v7.922l6.5-2.6V4.24zM7.5 14.762V6.838L1 4.239v7.923l6.5 2.6zM7.443.184a1.5 1.5 0 0 1 1.114 0l7.129 2.852A.5.5 0 0 1 16 3.5v8.662a1 1 0 0 1-.629.928l-7.185 2.874a.5.5 0 0 1-.372 0L.63 13.09a1 1 0 0 1-.63-.928V3.5a.5.5 0 0 1 .314-.464L7.443.184z"></path>
                            </svg>
                            如何维权？
                        </h3>
                    </div>
                    <div class="panel-body text-center">
                        <p>
                            1.鼠标滑动到消费者服务，点击<span class="glyphicon glyphicon-hand-right indication"></span>
                            <a class="otherBtn" data-a-id="card_5" href="https://w101.ttkefu.com/k/linkurl/?t=2B1ICB8" target="_blank">客服</a>
                        </p>
                        <p>2.可与客服沟通</p>
                        <p>3.沟通无果可进行<a class="otherBtn">投诉</a></p>
                        <p>4.无效沟通建议客户联系律师！</p>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-1"></div>
        <div class="col-md-2" id="attachNav">
            <ul class="nav nav-pills nav-stacked"  data-spy="affix" id="attNav_1"  >
                <li><a href="#footer" >直达底层</a></li>
                <li><a href="#card_1">如何寄件</a></li>
                <li><a href="#card_2">如何查询快递</a></li>
                <li><a href="#card_3">如何查询网点</a></li>
                <li><a href="#card_4">如何查询订单</a></li>
                <li><a href="#card_5">如何维权</a></li>
                <li><a href="#head">返回顶层</a> </li>
            </ul>
        </div>

    </div>
</div>

<!--页脚-->
<div id="footer" class="container-fluid  ">
    <div class="row">
        <div class="col-md-12">
            <p class="text-center" style="margin-top: 10px">
                <span class="glyphicon glyphicon-user"></span>
                <span>&nbsp;<a>@author&nbsp;<a>黄渝斌</a>&nbsp;<a>王振昭</a>&nbsp;<a>佘贵磊</a>&nbsp;<a>王辰</a></a></span>&nbsp;&nbsp;&nbsp;&nbsp;
            </p>
            <p class="text-center" style="margin-top: 10px">
                <span class="glyphicon glyphicon-envelope"></span>
                <span>&nbsp;<a>468949484@qq.com</a></span>&nbsp;&nbsp;&nbsp;&nbsp;
                <span class="glyphicon glyphicon-phone"></span>
                <span>&nbsp;<a>18277486571</a></span>
            </p>
            <p class="text-center">
                <span class="glyphicon glyphicon-home"></span>
                <span>&nbsp;<a>北京联合大学智慧城市学院</a></span>&nbsp;&nbsp;&nbsp;&nbsp;
                <span class="glyphicon glyphicon-tag"></span>
                <span>&nbsp;<a>北京联合大学第七届物流设计大赛参赛作品</a></span>

            </p>

        </div>

    </div>
</div>

</body>
</html>
