//获取学校类型
function getSchoolName(inSchoolTime) {
	if (inSchoolTime == "S") {
		return "小学";
	} else if (inSchoolTime == "ZX") {
		return "初中";
	} else if (inSchoolTime == "GZ") {
		return "高中";
	} else if (inSchoolTime == "ZZ") {
		return "中职";
	} else if (inSchoolTime == "TS") {
		return "特殊学校";
	} else {
		return "";
	}
}

function getSchoolVal(schoolName) {
	if (schoolName == "小学") {
		return "S";
	} else if (schoolName == "初中") {
		return "ZX";
	} else if (schoolName == "高中") {
		return "GZ";
	} else if (schoolName == "中职") {
		return "ZZ";
	} else if (schoolName == "特殊学校") {
		return "TS";
	} else {
		return "";
	}
}

function getAuditState(state) {
	if (state == "0") {
		return "申请审核";
	} else if (state == "1") {
		return "审核中";
	} else if (state == "2") {
//		return "待寄送";
		return "制卡中";
	} else if (state == "3") {
		return "已驳回";
	} else if (state == "5") {
		return "已寄送";
	} else if (state == "6") {
		return "已退款";
	} else {
		return "";
	}
}

function getGender(gender) {
	if (gender == "1") {
		return "男";
	} else if (gender == "2") {
		return "女";
	} 
}

Date.prototype.Format = function (fmt) { //author: meizz 
    var o = {
        "M+": this.getMonth() + 1, //月份 
        "d+": this.getDate(), //日 
        "h+": this.getHours(), //小时 
        "m+": this.getMinutes(), //分 
        "s+": this.getSeconds(), //秒 
        "q+": Math.floor((this.getMonth() + 3) / 3), //季度 
        "S": this.getMilliseconds() //毫秒 
    };
    if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
    for (var k in o)
    if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
    return fmt;
}

//身份证格式验证
function checkage() {
	var re;
	var str = $("#idCardNumber").val();
	var age = 0;
	if (str == '') {
		alert("身份证不能为空");
		return false;
	} else {
		var len = str.length;
		if (len != 15 && len != 18) {
			alert("不是有效身份证编码");
			return false;
		} else if (len == 15) {
			re = new RegExp(/^(\d{6})()?(\d{2})(\d{2})(\d{2})(\d{3})$/);
		} else {
			re = new RegExp(
					/^(\d{6})()?(\d{4})(\d{2})(\d{2})(\d{3})([0-9xX])$/);
		}
		var area = {
			11 : "北京",
			12 : "天津",
			13 : "河北",
			14 : "山西",
			15 : "内蒙古",
			21 : "辽宁",
			22 : "吉林",
			23 : "黑龙江",
			31 : "上海",
			32 : "江苏",
			33 : "浙江",
			34 : "安徽",
			35 : "福建",
			36 : "江西",
			37 : "山东",
			41 : "河南",
			42 : "湖北",
			43 : "湖南",
			44 : "广东",
			45 : "广西",
			46 : "海南",
			50 : "重庆",
			51 : "四川",
			52 : "贵州",
			53 : "云南",
			54 : "西藏",
			61 : "陕西",
			62 : "甘肃",
			63 : "青海",
			64 : "宁夏",
			65 : "新疆",
			71 : "台湾",
			81 : "香港",
			82 : "澳门",
			91 : "国外"
		}
		var idcard_array = new Array();
		idcard_array = str.split("");
		//地区检验
		if (area[parseInt(str.substr(0, 2))] == null) {
			alert("不是有效身份证编码");
			return false;
		}
		//出生日期正确性检验
		var a = str.match(re);
		if (a != null) {
			if (len == 15) {
				var DD = new Date("19" + a[3] + "/" + a[4] + "/" + a[5]);
				var flag = DD.getYear() == a[3]
						&& (DD.getMonth() + 1) == a[4]
						&& DD.getDate() == a[5];
			} else if (len == 18) {
				var DD = new Date(a[3] + "/" + a[4] + "/" + a[5]);
				var flag = DD.getFullYear() == a[3]
						&& (DD.getMonth() + 1) == a[4]
						&& DD.getDate() == a[5];
			}
			if (!flag) {
				alert("不是有效身份证编码");
				return false;

			}
			//检验校验位
			if (len == 18) {
				S = (parseInt(idcard_array[0]) + parseInt(idcard_array[10]))
						* 7
						+ (parseInt(idcard_array[1]) + parseInt(idcard_array[11]))
						* 9
						+ (parseInt(idcard_array[2]) + parseInt(idcard_array[12]))
						* 10
						+ (parseInt(idcard_array[3]) + parseInt(idcard_array[13]))
						* 5
						+ (parseInt(idcard_array[4]) + parseInt(idcard_array[14]))
						* 8
						+ (parseInt(idcard_array[5]) + parseInt(idcard_array[15]))
						* 4
						+ (parseInt(idcard_array[6]) + parseInt(idcard_array[16]))
						* 2
						+ parseInt(idcard_array[7])
						* 1
						+ parseInt(idcard_array[8])
						* 6
						+ parseInt(idcard_array[9]) * 3;

				Y = S % 11;
				M = "F";
				JYM = "10X98765432";
				M = JYM.substr(Y, 1); //判断校验位

				//检测ID的校验位
				if (M!= idcard_array[17]) {
					alert("不是有效身份证编码");
					return false;
				}
		} 
		}else {
			alert("不是有效身份证编码");
			return false;
		}
		var myDate = new Date();
		var year = myDate.getFullYear(); //获取完整的年份(4位,1970-????)
		var month = myDate.getMonth(); //获取当前月份(0-11,0代表1月)
		
		var cYearMonthDay=$("#cyear").attr("value");
		year=cYearMonthDay.substr(0,4);
		month=cYearMonthDay.substr(4,2);
		//alert("sss:"+year+" "+month);
		//return false;
		var yearme = 0;
		var monthme = 0;
		if (len == 18) {
			monthme = str.substr(10, 2);
			yearme = str.substr(6, 4);
			if (month > monthme) {
				age = year - yearme;
			} else {
				age = year - yearme - 1;
			}

		}
		if (len == 15) {
			monthme = str.substr(8, 2);
			yearme = "19" + str.substr(6, 2);
			if (month > monthme) {
				age = year - yearme;
			} else {
				age = year - parseInt(yearme) - 1;
			}

		}

	}
    if(age < 5){
    	alert("年龄小于最小办卡年龄");
    	return false;
    }
    else if (age > 19) {
		alert("超过办卡年龄");
		return false;
	} else {
		return true;
	}
}

//去掉空格
function Trim(str){ 
	return str.replace(/(^\s*)|(\s*$)/g, ""); 
}

(function ($) {
	$.extend({
		tyPost : function (data) {
			var _option = {
				option: {},
				success: function (data) {},
				error:function (XMLHttpRequest, textStatus, errorThrown){}
			};
			_option = $.extend({}, _option, data);
			$.ajax({
				type : "POST",
				url : "https://whtpay.whbaw.cn/paytest/alipayStuTest/postAction.php",
				//本地测试
//				url : "http://localhost/paytest/postAction.php",
				data : _option.option,
				contentType:"application/x-www-form-urlencoded",
				
				success : function(data) {
					_option.success(data);
				},
				error :function(XMLHttpRequest, textStatus, errorThrown){
					_option.error(XMLHttpRequest, textStatus, errorThrown);
				}
			});
		}
	})
})(jQuery);

