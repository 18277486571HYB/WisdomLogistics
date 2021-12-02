



//鼠标经过时弹出菜单,因为每个下拉列表的类名都相同，所以要用document对象
$(document).on("mouseover",".dropdown",function () {
    $(this).addClass('open');
})
$(document).on("mouseout",".dropdown",function () {
    $(this).removeClass('open');
})

function clearFormCss(btn) {
    let $form = $(btn);
    $form.find("input").parent().removeClass("has-success");
    $form.find("input").parent().removeClass("has-error");
    $form.find("input").parent().find("span").find(".help-block").text( "");
}

//表单清空
function clearForm(btn){
    let form=$(btn).parents().find("form");
    form[0].reset();
    form.find("input").parent().removeClass("has-success");
    form.find("input").parent().removeClass("has-error");
    form.find("input").parent().find("span").text( "");
}

function clearToForm(btn){
    let form=$(btn);
    form[0].reset();
    form.find("input").parent().removeClass("has-success");
    form.find("input").parent().removeClass("has-error");
    form.find("input").parent().find("span").find(".help-block").text( "");
}



function clear(btn) {
    $(btn)[0].reset();
    $(btn).find("input").parent().removeClass("has-success");
    $(btn).find("input").parent().removeClass("has-error");
    $(btn).find("input").parent().find("span").text( "");
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
    sf[34] = ["其它","北美洲|南美洲|亚洲|非洲|欧洲|大洋洲|未知"];
}catch(e){
    alert(e);
}
$(document).ready(function(e) {
    $(".Address").blur(function(){
        try{
            var pro=$(this).val();
            listAddress(pro);
        }catch(e){
            alert(e);
        }
    });
});

function listAddress(pro){
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
}

function listAddressById(pro,id){
    var i,j,tmpcity=[];
    for(i=0;i<sf.length;i++){
        if(pro===sf[i][0].toString()){
            tmpcity=sf[i][1].split("|");
            $(id).html("");
            for(j=0;j<tmpcity.length;j++){
                $(id).append("<option>"+tmpcity[j]+"</option>");
            }
        }
    }
}
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
    let myModal=$(this).parents().find(".modal");
    let modalHead = myModal.find(".modal-header").find(".modal-title");
    modalHead.text(headerText).addClass("text-center");
    modalHead.attr("data-val",$(this).attr("data-val"))
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
        $(id).parent().removeClass("has-success");
        $(id).parent().addClass("has-error");
        span.text("输入不能为空");
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
$(document).on("blur","#username,#registerUsername,#editUsername",function () {
    let ex=/^[a-zA-Z0-9_-]{4,16}$/;
    let alertText="用户名必须4-16位，可以字母数字下划线";
    Checked(ex,this,alertText);
})

//    密码校验
$(document).on("blur","#password,#registerPassword,#editPassword",function () {
    let ex=/^\S*(?=\S{6,})(?=\S*\d)(?=\S*[A-Z])(?=\S*[a-z])(?=\S*[!@#$%^&*? ])\S*$/;
    let alertText="最少六位，包括大小写字母，数字，特殊字符";
    Checked(ex,this,alertText);
})

//密码确认
$(document).on("blur","#confirmPassword",function () {
    let passwordBtn=$("#registerPassword");
    let confirmPasswordBtn=$("#confirmPassword");
    if (passwordBtn.val()!==confirmPasswordBtn.val()){
        confirmPasswordBtn.parent().addClass("has-error");
        confirmPasswordBtn.parent().find("span").text("两次密码必须一致")
    }else {
        confirmPasswordBtn.parent().removeClass("has-error");
        confirmPasswordBtn.parent().addClass("has-success");
        confirmPasswordBtn.parent().find("span").text("");
    }
})

//    邮箱校验
$(document).on("blur","#registerEmail,#editEmail",function () {
    let ex=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
    let alertText="请输入带@的正确邮箱格式";
    Checked(ex,this,alertText);
})
//    电话校验
$(document).on("blur","#customPhone,#registerPhone,#userphone,#queryPhone,#toPhone,#editPhone,#addPhone",function () {
    let ex=/^(?:(?:\+|00)86)?1\d{10}$/;
    let alertText="请输入正确的手机号码";
    Checked(ex,this,alertText);
})

$(document).on("click",".checkAll",function () {
    //    下面我们要做的事情就是选中所有，下面所有的都跟着选中，就要改变input标签里的checked属性
    //    在input标签中，我们没有显示写checked属性，但其是默认有的，
    //    对于这种原生的属性的，我们用attr就不那么好看，所以可以用prop
    //    attr可以获取咱们自定义的属性

    //    1.我们先拿到所有的checked
    let allChecked = $(this).prop("checked");
    //    2.上面返回true或者false，然后我们用这个修改单个选择,这里最好用类选择器，因为我们本身就要全部选中
    $(this).closest("table").find(".checked_item").prop("checked",allChecked);
});



$(document).on("click",".checked_item",function () {
    //    获取单个全部选中时的长度
    let totalLength=$(".checked_item").length;
    //    单个选中的总个数
    let itemLength=$(".checked_item:checked").length;

    let checkAll=$(this).closest("table").find(".checkAll");

    if (totalLength===itemLength) checkAll.prop("checked",true);

    if (totalLength!==itemLength) checkAll.prop("checked",false);
})

function subString(string,character) {
    return string.split(character);
}

var total;
var pageNum;

function toPage(method,path,post,pageCountId,pageId,$total,$pageNum,alert) {
    total=$total;
    pageNum=$pageNum;
    $.ajax({
        url:path+pageNum,
        type:post,
        success:function (data) {

            if (data.code==="200"){
                method(data);
                pageCount(pageCountId,data);
                page(method,path,post,pageCountId,pageId,data);
            }else{
                alert();
            }

        }
    })
}

function page(method,path,post,pageCountId,pageId,data) {

    $(pageId).empty();
    var ul=$("<ul></ul>").addClass("pagination");

    //首页
    var firstPage=$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
    firstPage.click(function () {
        toPage(method,path,post,pageCountId,pageId,total,1,data);
    });

    //上一页
    var upPage=$("<li></li>").append($("<a></a>").append("<span></span>").append("&laquo;").attr("href","#").attr("id","firstPage"));
    upPage.click(function () {
        toPage(method,path,post,pageCountId,pageId,total,pageNum-1,data);
    });

    if(!data.map.pageInfo.hasPreviousPage){
        firstPage.addClass("disabled");
        upPage.addClass("disabled");
    }
    //首页，前一页
    ul.append(firstPage).append(upPage);

    $.each(data.map.pageInfo.navigatepageNums,function (index,itme) {
        var numi=$("<li></li>").append($("<a></a>").append(itme).attr("href","#"));
        numi.click(function () {
            toPage(method,path,post,pageCountId,pageId,total,itme,data);
        });

        if (pageNum===itme){
            numi.addClass("active");
        }
        //    当前页
        ul.append(numi);
    })
    //下一页
    var downPage=$("<li></li>").append($("<a></a>").append("<span></span>").append("&raquo;").attr("href","#"));
    downPage.click(function () {
        toPage(method,path,post,pageCountId,pageId,total,pageNum+1,data);
    });

    //末页
    var endPage=$("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
    endPage.click(function () {
        toPage(method,path,post,pageCountId,pageId,total,data.map.pageInfo.pages,data);
    });

    if(!data.map.pageInfo.hasNextPage){
        endPage.addClass("disabled");
        downPage.addClass("disabled");
    }
    ul.append(downPage).append(endPage);

    var nav=$("<nav></nav>").append(ul);

    $(pageId).append(nav);
}

function pageCount(name,data) {
    $(name).empty();
    var page=data.map.pageInfo;
    $(name).append("当前"+page.pageNum+"页，总"+page.pages+"页，总"+
        page.total+"记录");
    total=page.total;
    pageNum=page.pageNum;
}



