<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<title>商品</title>
	<link href="${pageContext.request.contextPath }/css/common.css"
		rel="stylesheet" type="text/css">
		<link href="${pageContext.request.contextPath }/css/product.css"
			rel="stylesheet" type="text/css">
			<script>
				function saveCart() {
					document.getElementById("cartForm").submit();
				}
			</script>
</head>
<body>

	<div class="container header">
		<div class="span5">
			<div class="logo">
				<a href="http://localhost:8080/FYshop/"> <img
					src="${pageContext.request.contextPath }/image/logo/logo.png"
					alt="飞鱼" /></a>
			</div>
		</div>
		<div class="span9">
			<div class="headerAd">
				<img src="${pageContext.request.contextPath }/image/header.jpg"
					alt="正品保障" title="正品保障" height="50" width="320">
			</div>
		</div>

		<%@ include file="menu.jsp"%>

	</div>
	<div class="container productContent">
		<div class="span6">
			<div class="hotProductCategory">
				<s:iterator var="c" value="#session.cList">
					<dl>
						<dt>
							<a
								href="${pageContext.request.contextPath }/product_findByCid?cid=<s:property value="#c.cid"/>&page=1"><s:property
									value="#c.cname" /></a>
						</dt>
						<s:iterator var="cs" value="#c.categorySeconds">
							<dd>
								<a
									href="${pageContext.request.contextPath }/product_findByCsid?csid=<s:property value="#cs.csid"/>&page=1"><s:property
										value="#cs.csname" /></a>
							</dd>
						</s:iterator>
					</dl>
				</s:iterator>
			</div>

		</div>
		<div class="span18 last">

			<div class="productImage">
				<a title="" style="outline-style: none; text-decoration: none;"
					id="zoom" href="#" rel="gallery">
					<div class="zoomPad">
						<img style="opacity: 1;" title="" class="medium"
							src="${pageContext.request.contextPath }/<s:property value="model.image"/>"><div
								style="display: block; top: 0px; left: 162px; width: 0px; height: 0px; position: absolute; border-width: 1px;"
								class="zoomPup"></div>
							<div
								style="visibility: hidden; top: 129.5px; left: 106px; position: absolute;"
								class="zoomPreload">Loading zoom</div>
					</div>
				</a>

			</div>
			<div class="name">
				<s:property value="model.pname" />
			</div>
			<div class="sn">
				<div>
					编号：
					<s:property value="model.pid" />
				</div>
			</div>
			<div class="info">
				<dl>
					<dt>商城价:</dt>
					<dd>
						<strong>￥：<s:property value="model.shop_price" />元
						</strong> 参 考 价：
						<del>
							￥
							<s:property value="model.market_price" />
							元
						</del>
					</dd>
				</dl>
				<dl>
					<dt>促销:</dt>
					<dd>
						<a target="_blank" title="限时抢购 (2018-03-01 ~ 2018-04-30)">限时抢购</a>
					</dd>
				</dl>
				<dl>
					<dt></dt>
					<dd>
						<span> </span>
					</dd>
				</dl>
			</div>
			<form id="cartForm"
				action="${ pageContext.request.contextPath }/cart_addCart"
				method="post">
				<input type="hidden" name="pid"
					value="<s:property value="model.pid"/>" />
				<div class="action">
					<dl class="quantity">
						<dt>购买数量:</dt>
						<dd>
							<input id="count" name="count" value="1" maxlength="4"
								onpaste="return false;" type="text" />
						</dd>
						<dd>件</dd>
					</dl>

					<div class="buy">
						<input id="addCart" class="addCart" value="加入购物车" type="button"
							onclick="saveCart()" />
					</div>
				</div>
			</form>
			<div id="bar" class="bar">
				<ul>
					<li id="introductionTab"><a href="#introduction">商品介绍</a></li>

				</ul>
			</div>

			<div id="introduction" name="introduction" class="introduction">
				<div class="title">
					<strong><s:property value="model.pdesc" /></strong>
				</div>
				<div>
					<img
						src="${pageContext.request.contextPath }/<s:property value="model.image"/>">
				</div>
			</div>



		</div>
	</div>
	<div class="container footer">
		<div class="span24">
			<div class="footerAd">
				<img src="${pageContext.request.contextPath }/image/footer.jpg"
					alt="我们的优势" title="我们的优势" height="52" width="950">
			</div>
		</div>
		<div class="span24">
			<ul class="bottomNav">
				<li><a href="#">关于我们</a> |</li>
				<li><a href="#">联系我们</a> |</li>
				<li><a href="#">诚聘英才</a> |</li>
				<li><a href="#">法律声明</a> |</li>
				<li><a>友情链接</a> |</li>
				<li><a target="_blank">支付方式</a> |</li>
				<li><a target="_blank">配送方式</a> |</li>
				<li><a>SHOP++官网</a> |</li>
				<li><a>SHOP++论坛</a></li>
			</ul>
		</div>
		<div class="span24">
			<div class="copyright">Copyright © 2018-2018 网上商城 版权所有</div>
		</div>
	</div>
</body>
</html>