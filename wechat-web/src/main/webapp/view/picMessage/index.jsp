<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" type="text/css" href="/view/picMessage/index/client-page1530cb.css">
    <style>
        #nickname {
            overflow: hidden;
            white-space: nowrap;
            text-overflow: ellipsis;
            max-width: 90%;
        }

        ol, ul {
            list-style-position: inside;
        }
    </style>
</head>
<body id="activity-detail">

<div class="page-bizinfo">
    <div class="header">
        <!--标题-->
        <h1 id="activity-name"><s:property value="picMessage.title"/></h1>

        <!--日期-->
        <span id="post-date"><s:date name="picMessage.modified" format="yyyy-MM-dd"/></span>
    </div>
</div>

<div class="page-content">
    <div class="media" id="media">
        <!--图片-->
        <img src="<s:property value="picMessage.picUrl"/>" >
    </div>
    <div class="text">
        <!--正文内容-->
        <textarea><s:property value="picMessage.message" escape="false"/></textarea>
    </div>
</div>

<script src="/view/picMessage/index/jquery-1.js"></script>
<script src="/view/picMessage/index/wxm-core1530d0.js"></script>
<!--
<script id="txt-desc" type="txt/text"></script>
<script id="txt-title" type="txt/text"></script>
<script id="txt-sourceurl" type="txt/text"></script>
<script>
(function(){
	/**
	 * @description get a Max length for text, cut the long words
	 * @author zemzheng
	 **/
	var _dom = jQuery('.text'), _html0 = _dom.html();
	_em = jQuery('<p></p>').html('a').css({display:'inline'}),
	_init  = function(){
	    _em.appendTo(_dom);
	    var _html = _html0, _max = Math.floor( _dom.width() / _em.width() ),  _reg = new RegExp('[a-z1-9]{' + _max + ',}', 'ig');
	    _em.remove();

	    _html = _html.replace(/>[^<]+</g,function(txt){
		    return txt.replace(_reg, function(str){
			    var _str = str, result = []
			    while(_str.length > _max){
			        result.push(
				        _str.substr(0, _max)
			        );
			        _str = _str.substr(_max);
			    }
				result.push(_str);
				return result.join('<br/>');
		    });
	    });

	    _dom.html(_html);
		//console.log(_dom.html());
   };
	jQuery(window).on('resize', _init).trigger('resize');
	
})();

function getStrFromTxtDom(selector){
return jQuery('#txt-' + selector).html().replace(/&lt;/g, '<').replace(/&gt;/g, '>');
}


	  function report(link, fakeid, action_type){
		var parse_link = parseUrl(link);
		if(parse_link == null)
		{
		  return ;
		}
		var query_obj = parseParams( parse_link['query_str'] );
		query_obj['action_type'] = action_type;
		query_obj['uin'] = fakeid;
		var report_url = '/mp/appmsg/show?' + jQuery.param( query_obj );
		jQuery.ajax({
		  url: report_url,
		  type: 'POST',
		  timeout: 2000
		})
	  };

	  function share_scene(link, scene_type){
		var parse_link = parseUrl(link);
		if(parse_link == null)
		{
		  return link;
		}
		var query_obj = parseParams( parse_link['query_str'] );
		query_obj['scene'] = scene_type;
		var share_url = 'http://' + parse_link['domain'] + parse_link['path'] + '?' + jQuery.param( query_obj ) + (parse_link['sharp'] ? parse_link['sharp'] : '');
		return share_url;
	  };
	  
  //report("http://mp.weixin.qq.com/mp/appmsg/show?__biz=MjM5NjQxMDI4Mg==&appmsgid=10000020&itemidx=1#wechat_redirect",1);
  //console.log('share url %s', share_scene("http://mp.weixin.qq.com/mp/appmsg/show?__biz=MjM5NjQxMDI4Mg==&appmsgid=10000020&itemidx=1#wechat_redirect", 1));
		(function(){
	var onBridgeReady =  function () {
	  var 
		appId  = '',
			  imgUrl = "http://mmsns.qpic.cn/mmsns/VXvB3GPVYYr9FzXXLQImAxTdDIvJ3GMefSdoZuCw3iaWEJVPY01zRhQ/0",
			  link   = "http://mp.weixin.qq.com/mp/appmsg/show?__biz=MjM5NjQxMDI4Mg==&appmsgid=10000020&itemidx=1#wechat_redirect",
					title  = htmlDecode("阿萨德发斯蒂芬"),
		desc   = htmlDecode("是短发阿萨德发阿萨德发阿萨德发是短发是短发是短发"),
		fakeid = "",
		desc = desc || link;	



				// 发送给好友; 
	  WeixinJSBridge.on('menu:share:appmessage', function(argv){
		
					WeixinJSBridge.invoke('sendAppMessage',{
										  "appid"      : appId,
										  "img_url"    : imgUrl,
										  "img_width"  : "640",
										  "img_height" : "640",
										  "link"       : share_scene(link, 1),
										  "desc"       : desc,
										  "title"      : title
					}, function(res) {report(link, fakeid, 1);
					});
				});
				// 分享到朋友圈;
	  WeixinJSBridge.on('menu:share:timeline', function(argv){
		report(link, fakeid, 2);
					WeixinJSBridge.invoke('shareTimeline',{
										  "img_url"    : imgUrl,
										  "img_width"  : "640",
										  "img_height" : "640",
										  "link"       : share_scene(link, 2),
										  "desc"       : desc,
										  "title"      : title
										  }, function(res) {
					});
		
				});

				// 分享到微博;
				var weiboContent = '';
	  WeixinJSBridge.on('menu:share:weibo', function(argv){
		
					WeixinJSBridge.invoke('shareWeibo',{
										  "content" : title + share_scene(link, 3),
										  "url"     : share_scene(link, 3) 
										  }, function(res) {report(link, fakeid, 3);
										  });
				});
				// 隐藏右上角的选项菜单入口;
				//WeixinJSBridge.call('hideOptionMenu');
			};
	if(document.addEventListener){
	  document.addEventListener('WeixinJSBridgeReady', onBridgeReady, false);
	} else if(document.attachEvent){
	  document.attachEvent('WeixinJSBridgeReady'   , onBridgeReady);
	  document.attachEvent('onWeixinJSBridgeReady' , onBridgeReady);
	}
		})();
	</script>-->

</body>
</html>