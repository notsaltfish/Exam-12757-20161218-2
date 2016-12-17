<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="../../baselist.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title></title>
</head>

<body>
<form name="icform" method="post">

<div id="menubar">
<div id="middleMenubar">
<div id="innerMenubar">
  <div id="navMenubar">
<ul>


<li id="view"><a href="#" onclick="formSubmit('toView.action','_self');this.blur();">查看</a></li>
<li id="view"><a href="#" onclick="formSubmit('toCreate.action','_self');this.blur();">增加</a></li>
<li id="view"><a href="#" onclick="formSubmit('toUpdate.action','_self');this.blur();">修改</a></li>
<li id="delete"><a href="#" onclick="formSubmit('delete.action','_self');this.blur();">删除</a></li>
<li id="new" ><a href="#" onclick="formSubmit('submit.action','_self');this.blur();">提交</a></li>
<li id="new" ><a  href="#" onclick="formSubmit('cancel.action','_self');this.blur();">草稿</a></li>
<li id="new" ><a  href="#" onclick="formSubmit('print.action','_self');this.blur();">打印</a></li>
<li id="new"  style="white-space:nowrap;"><a  href="#" onclick="formSubmit('printTemplate.action','_self');this.blur();">模板打印</a></li>
 
</ul>
  </div>
</div>
</div>
</div>
   
<!-- 页面主体部分（列表等） -->  
<div class="textbox" id="centerTextbox">
  <div class="textbox-header">
  <div class="textbox-inner-header">
  <div class="textbox-title">



<div class="eXtremeTable" >
<table id="ec_table" class="tableRegion" width="98%" >
	<thead>
	<tr>
		<td class="tableHeader"><input type="checkbox" name="selid" onclick="checkAll('id',this)"></td>
		<td class="tableHeader">序号</td>
		<td class="tableHeader">合同号</td>
		<td class="tableHeader">货物/附件</td>
		<td class="tableHeader">客户名称</td>
		<td class="tableHeader">制单人</td>
		<td class="tableHeader">审单人</td>
		<td class="tableHeader">验货员</td>
		<td class="tableHeader">签单日期</td>
		<td class="tableHeader">交货期限</td>
		<td class="tableHeader">船期</td>
		<td class="tableHeader">总金额</td>
		<td class="tableHeader">状态</td>
		<td class="tableHeader">操作</td>
	</tr>
	</thead>
	<tbody class="tableBody" >
	
	<c:forEach items="${dataList}" var="o" varStatus="status">
	<tr class="odd" onmouseover="this.className='highlight'" onmouseout="this.className='odd'" >
		<td><input type="checkbox" name="id" value="${o.id}"/></td>
		<td>${status.index+1}</td>
		<td><a href="toView.action?id=${o.id}">${o.contractNo}</a></td>
		<td>${o.cpnum}/${o.extnum } </td>
		<td>${o.customName}</td>
		<td>${o.inputBy}</td>
		<td>${o.checkBy}</td>
		<td>${o.inspector}</td>
		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${o.signingDate}"></fmt:formatDate></td>
		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${o.deliveryPeriod}"></fmt:formatDate></td>
		<td><fmt:formatDate pattern="yyyy-MM-dd" value="${o.shipTime}"></fmt:formatDate></td>
		<td>${o.totalAmount}</td>
		<c:if test="${o.state ==1}">
			<td>已上报</td>	
		</c:if>
		<c:if test="${o.state ==0}">
			<td>草稿</td>	
		</c:if>
	
	<td><a href="${ctx}/cargo/contractproduct/tocreate.action?contractId=${o.id}">[货物]</a></td>
	</tr>
	</c:forEach>
	
	</tbody>
</table>
</div>
 
</div>
 
 
</form>
</body>
</html>

