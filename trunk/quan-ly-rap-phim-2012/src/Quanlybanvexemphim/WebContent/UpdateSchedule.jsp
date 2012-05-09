<%@ page import="sg.com.customer.JAVA01.model.UpdateSchedule"%>
<%@ page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<link href="Dinhdang.css" rel="stylesheet" type="text/css" />
<script src="datetimepicker_css.js"></script>
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	ArrayList<UpdateSchedule> arrUpdateScheduleDate = new ArrayList<UpdateSchedule>();
		arrUpdateScheduleDate = (ArrayList<UpdateSchedule>) request.getAttribute("arrUpdateScheduleDate");

		String vendorName = (String) request.getAttribute("vendorName");
		String importantLevel = (String) request
				.getAttribute("importantLevel");
		String vendorTurnaroundTime = (String) request
				.getAttribute("vendorTurnaroundTime");
		String turnArountTime = (String) request
				.getAttribute("turnAroundTime");
		int dayNo = (Integer) request.getAttribute("dayNo");

		String contractNumber = (String) request
				.getParameter("contractNumber");

		request.setAttribute("contractNo", contractNumber);

		String actualEndDate = (String) request
				.getAttribute("actualEndDate");

		String dateAdv = (String) request
				.getAttribute("dateAdvtoClient");
%>
<script type="text/javascript">
	function cancelSubmit() {
	    document.UpdateScheduleForm.action = "ListSchedule.jsp";
		return true;
	}
	function updateSubmit() {
		var ONE_DAY = 1000 * 60 * 60 * 24;
		var currentDate = new Date;

		var expectedStartDate = document.getElementById("expectedStartDate");
		var dateAdvtoClient =  document.getElementById("dateAdvtoClient");
		var actualStartDate = document.getElementById("actualStartDate");
	
		var dayExpectedStartDate = expectedStartDate.value.substring(8,10);
		var monthExpectedStartDate = expectedStartDate.value.substring(5,7);
		var yearExpectedStartDate = expectedStartDate.value.substring(0,4);

		var dayActualStartDate = actualStartDate.value.substring(8,10);
		var monthActualStartDate = actualStartDate.value.substring(5,7);
		var yearActualStartDate = actualStartDate.value.substring(0,4);

		var formatExpectedStartDate = monthExpectedStartDate + "/" + dayExpectedStartDate + "/" + yearExpectedStartDate;
		
        var formarActualStartDate = monthActualStartDate + "/" + dayActualStartDate + "/" + yearActualStartDate;
    
       
        var parseExpectedStartDate = Date.parse(formatExpectedStartDate);
        var parseActualStartDate = Date.parse(formarActualStartDate);

        var convertExpectedStartDateToJavaDate = new Date(parseExpectedStartDate);
        var convertActualStartDate =  new Date(parseActualStartDate);

		var getTimeExpectedStartDateJavaDate = convertExpectedStartDateToJavaDate.getTime();
		var getTimeActualStartDate = convertActualStartDate.getTime();
		var getTimeCurrentDate = currentDate.getTime();

		var actualDateSubtractExpectedStartDate = getTimeActualStartDate - getTimeExpectedStartDateJavaDate;
		var actualDateSubtractCurrentDate = getTimeActualStartDate - getTimeCurrentDate;

		var resultOfActualDateSubtractExpectedStartDate = Math.round(actualDateSubtractExpectedStartDate/ONE_DAY);
		var resultOfActualDateSubtractCurrentDate = Math.round(actualDateSubtractCurrentDate/ONE_DAY);
		if(resultOfActualDateSubtractExpectedStartDate < 0 || resultOfActualDateSubtractCurrentDate>0 || resultOfActualDateSubtractExpectedStartDate=="" || resultOfActualDateSubtractExpectedStartDate==null){
			alert("Actual Start Date Invalid.");
			return false;
		}
		if(dateAdvtoClient.value == null || dateAdvtoClient.value==""){
			alert("Vendor Received Date must be entered.");
			return false;
		}else{
		document.UpdateScheduleForm.action = "updateSchedule.do";
		return true;
		}
	}
	function terminatedSubmit() {
		document.UpdateScheduleForm.action = "terminated.do";
		confirm("");
		return true;
	}
	function changeDate() {
		
		var contractNumber = "<%=request.getAttribute("contractNo")%>";
		document.UpdateScheduleForm.action = "infoSchedule.do?contractNumber="+contractNumber;
		document.UpdateScheduleForm.submit();
	}
	function changeActualDate(){
	    var ONE_DAY = 1000 * 60 * 60 * 24;

	    var vendorTurnaroundTime = document.getElementById("vendorTurnaroundTime");
		var stringActualStartDate = document.getElementById("actualStartDate");
		var stringActualEndDate = document.getElementById("actualEndDate");
		
		var dayActualEndDate = stringActualEndDate.value.substring(8,10); 
		var monthActualEndDate = stringActualEndDate.value.substring(5,7);
		var yearActualEndDate = stringActualEndDate.value.substring(0,4);
		
		var dayActualStartDate = stringActualStartDate.value.substring(8,10); 
		var monthActualStartDate = stringActualStartDate.value.substring(5,7);
		var yearActualStartDate = stringActualStartDate.value.substring(0,4);
		
		
		var formatActualEndDate = monthActualEndDate +"/"+ dayActualEndDate +"/"+ yearActualEndDate;
		var formatActualStartDate = monthActualStartDate +"/"+ dayActualStartDate +"/"+ yearActualStartDate;
		
		var parseActualEndDate = Date.parse(formatActualEndDate);
		var parseActualStartDate = Date.parse(formatActualStartDate);
		
		var convertActualEndDateToJavaDate = new Date(parseActualEndDate);
		var convertActualStartDateToJavaDate = new Date(parseActualStartDate);
		
		var getTimeActualEndJavaDate = convertActualEndDateToJavaDate.getTime();
		var getTimeActualStartJavaDate = convertActualStartDateToJavaDate.getTime();

		var count =Math.abs(getTimeActualEndJavaDate - getTimeActualStartJavaDate);
		
		vendorTurnaroundTime.value = Math.round(count/ONE_DAY);
	}
</script>
<html:form action="infoSchedule" method="post">
	<%
		if (dayNo < 0) {
	%>
	<div class="div_tieude"><img src="images/icon.JPG" align="left"
		height="25"> <img src="images/icon2.JPG" align="right"
		height="25"> <b class="font_tieude">Active Project
	Maintenance ...</b></div>
	<table class="table_1">
		<tr>
			<td>
			<div class="div_2">
			<table class="table_2">
				<tr class="tr">
					<td width="280">Contract Number :</td>
					<td width="150" align="right"><%=contractNumber%><html:hidden
						property="contractNumber" value="<%=contractNumber%>" /></td>
					<td width="20"></td>
					<td width="280">Vendor Name :</td>
					<td width="120" align="right"><select name="vendorName">
						<logic:iterate id="listVendorNameItem" name="listVendorName">
							<logic:equal value="<%=vendorName %>" name="listVendorNameItem"
								property="vendorName">
								<option selected="selected"><bean:write
									name="listVendorNameItem" property="vendorName" /></option>
							</logic:equal>
							<logic:notEqual value="<%=vendorName %>"
								name="listVendorNameItem" property="vendorName">
								<option><bean:write name="listVendorNameItem"
									property="vendorName" /></option>
							</logic:notEqual>
						</logic:iterate>

					</select></td>
				</tr>
				<tr class="tr">
					<td width="260">Important Level :</td>
					<td width="150" align="right"><select name="importantLevel">
						<logic:iterate id="importantItem" name="listImportantLevel">
							<logic:equal value="<%=importantLevel %>" name="importantItem"
								property="importantLevel">
								<option selected="selected"><bean:write
									name="importantItem" property="importantLevel" /></option>
							</logic:equal>
							<logic:notEqual value="<%=importantLevel %>" name="importantItem"
								property="importantLevel">
								<option><bean:write name="importantItem"
									property="importantLevel" /></option>
							</logic:notEqual>
						</logic:iterate>
					</select></td>
					<td width="20"></td>
					<td width="260">Project/Contract Priority :</td>
					<td width="120" align="right"><select name="priorityCode">
						<logic:iterate id="priorityItem" name="listPriority">
							<option
								value="<bean:write name="priorityItem" property="priorityCode"/>"><bean:write
								name="priorityItem" property="priorityCode" /> - <bean:write
								name="priorityItem" property="priorityName" /></option>
						</logic:iterate>
					</select></td>
				</tr>
				<tr class="tr">
					<td width="260">Vendor Received Date<font color="red">*</font>
					:</td>
					<td width="150" align="right"><logic:iterate id="infoDateItem"
						name="infoDate">
						<input type="text" size="8" name="vendorRecivedDate"
							id="vendorRecivedDate" readonly="readonly"
							value="<bean:write name="infoDateItem" property="vendorRecivedDate"/>">
					</logic:iterate> <img src="images/lich.JPG"
						onclick="javascript:NewCssCal('vendorRecivedDate','YYYYMMDD')">
					</td>
					<td width="20"></td>
					<td width="260">Date Adv to Client(dd/mm/yyyy) :</td>
					<td width="120" align="right">
					<%
						if (dateAdv != null) {
					%> <input type="text" name="dateAdvtoClient" id="dateAdvtoClient"
						size="8" onchange="changeDate();" value="<%=dateAdv%>"> <%
 	} else {
 %> <logic:iterate id="infoDateItem" name="infoDate">
						<input type="text" name="dateAdvtoClient" id="dateAdvtoClient"
							size="8" onchange="changeDate();"
							value="<bean:write name="infoDateItem" property="dateAdvtoClient"/>">
					</logic:iterate> <%
 	}
 %> <html:img src="images/lich.JPG"
						onclick="javascript:NewCssCal('dateAdvtoClient','YYYYMMDD')" /></td>
				</tr>
				<tr class="tr">
					<td width="260">Expected Start Date (dd/mm/yyyy) :</td>
					<td width="150" align="right"><logic:iterate id="infoDateItem"
						name="infoDate">
						<html:hidden property="expectedStartDate"
							styleId="expectedStartDate"
							value="<%=arrUpdateScheduleDate.get(0).getExpectedStartDate() %>" />
						<bean:write name="infoDateItem" property="expectedStartDate" />
					</logic:iterate></td>
					<td width="20"></td>
					<td width="260">Expected End Date (dd/mm/yyyy) :</td>
					<td width="120" align="right"><logic:iterate id="infoDateItem"
						name="infoDate">
						<html:hidden property="expectedEndDate"
							value="<%=arrUpdateScheduleDate.get(0).getExpectedEndDate() %>" />
						<bean:write name="infoDateItem" property="expectedEndDate" />
					</logic:iterate></td>
				</tr>
				<tr class="tr">
					<td width="260">Actual Start Date (dd/mm/yyyy) :</td>
					<td width="150" align="right"><logic:iterate id="infoDateItem"
						name="infoDate">
						<input type="text" size="8" name="actualStartDate"
							id="actualStartDate" readonly="readonly"
							value="<bean:write name="infoDateItem" property="actualStartDate"/>">
					</logic:iterate> <img src="images/lich.JPG"
						onclick="javascript:NewCssCal('actualStartDate','YYYYMMDD')">
					</td>
					<td width="20"></td>
					<td width="260">Actual End Date (dd/mm/yyyy) :</td>
					<td width="120" align="right">
					<%
						if (actualEndDate != null) {
					%> <input type="text" name="actualEndDate" id="actualEndDate"
						size="8" onchange="changeActualDate();" readonly="readonly"
						value="<%=actualEndDate%>" /> <%
 	} else {
 %> <logic:iterate id="infoDateItem" name="infoDate">
						<input type="text" name="actualEndDate" size="8"
							onchange="changeActualDate();" readonly="readonly"
							value="<bean:write name="infoDateItem" property="actualEndDate"/>" />
					</logic:iterate> <%
 	}
 %> <img src="images/lich.JPG"
						onclick="javascript:NewCssCal('actualEndDate','YYYYMMDD')"></td>
				</tr>
				<tr class="tr">
					<td width="260">Is Terminated ? :</td>
					<td width="150" align="right"><input type="checkbox"
						name="isTerminated"></td>
					<td width="20"></td>
					<td width="260">Number of Vendor Staff Assigned<font
						color="red">*</font> :</td>
					<td width="120" align="right"><logic:iterate id="infoDateItem"
						name="infoDate">
						<input type="text" name="numberofVendorStaffAssigned" size="3"
							value="<bean:write name="infoDateItem" property="numberofVendorStaffAssigned"/>" />
					</logic:iterate></td>
				</tr>
				<tr class="tr">
					<td width="260">Vendor Turnaround Time (Day) :</td>
					<td width="150" align="right"><html:text
						property="vendorTurnaroundTime" disabled="false" readonly="true"
						size="3"
						value="<%=arrUpdateScheduleDate.get(0).getVendorTurnaroundTime() %>"
						styleId="vendorTurnaroundTime"></html:text></td>
					<td width="20"></td>
					<td width="260">Turnaround Time (Day) :</td>
					<td width="120" align="right">
					<%
						if (turnArountTime != null) {
					%> <html:text property="turnAroundTime" disabled="false"
						readonly="true" size="3" value="<%=turnArountTime%>"></html:text>
					<%
						} else {
					%> <html:text property="turnAroundTime" disabled="false"
						readonly="true" size="3"
						value="<%=arrUpdateScheduleDate.get(0).getTurnAroundTime() %>"></html:text>
					<%
						}
					%>
					</td>
				</tr>
			</table>
			<table width="435">
				<tr class="tr">
					<td valign="top" width="60">Remarks :</td>
					<td width="345" align="right"><textarea rows="3" cols="30"
						name="remarks"></textarea></td>
				</tr>
			</table>
			<table width="950">
				<tr>
					<td align="center"><input type="reset" value="   Clear   " />
					<input type="submit" value=" Update "
						onclick="return updateSubmit();" /> <input type="submit"
						value=" Cancel " onclick="return cancelSubmit();" /></td>
				</tr>
			</table>
			</div>
			</td>
		</tr>
	</table>
	<%
		} else {
	%>
	<div class="div_tieude"><img src="images/icon.JPG" align="left"
		height="25"> <img src="images/icon2.JPG" align="right"
		height="25"> <b class="font_tieude">Active Project
	Maintenance ...</b></div>
	<table class="table_1">
		<tr>
			<td>
			<div class="div_2">
			<table class="table_2" border="1">
				<tr class="tr">
					<td width="280">Contract Number :</td>
					<td width="150" align="right"><%=request.getParameter("contractNumber")%>
					<html:hidden property="contractNumber" value="<%=contractNumber%>" />
					</td>
					<td width="20"></td>
					<td width="280">Vendor Name :</td>
					<td width="120" align="right"><select>
						<logic:iterate id="listVendorNameItem" name="listVendorName">
							<logic:equal value="<%=vendorName %>" name="listVendorNameItem"
								property="vendorName">
								<option selected="selected"><bean:write
									name="listVendorNameItem" property="vendorName" /></option>
							</logic:equal>
							<logic:notEqual value="<%=vendorName %>"
								name="listVendorNameItem" property="vendorName">
								<option><bean:write name="listVendorNameItem"
									property="vendorName" /></option>
							</logic:notEqual>
						</logic:iterate>

					</select></td>
				</tr>
				<tr class="tr">
					<td width="260">Important Level :</td>
					<td width="150" align="right"><select name="importantLevel">
						<logic:iterate id="importantItem" name="listImportantLevel">
							<logic:equal value="<%=importantLevel %>" name="importantItem"
								property="importantLevel">
								<option selected="selected"><bean:write
									name="importantItem" property="importantLevel" /></option>
							</logic:equal>
							<logic:notEqual value="<%=importantLevel %>" name="importantItem"
								property="importantLevel">
								<option><bean:write name="importantItem"
									property="importantLevel" /></option>
							</logic:notEqual>
						</logic:iterate>
					</select></td>
					<td width="20"></td>
					<td width="260">Project/Contract Priority :</td>
					<td width="120" align="right"><select name="priorityCode">
						<logic:iterate id="priorityItem" name="listPriority">
							<option value="priorityCode"><bean:write
								name="priorityItem" property="priorityCode" /> - <bean:write
								name="priorityItem" property="priorityName" /></option>
						</logic:iterate>
					</select></td>
				</tr>
				<tr class="tr">
					<td width="260">Vendor Received Date<font color="red">*</font>
					:</td>
					<td width="150" align="right"><logic:iterate id="infoDateItem"
						name="infoDate">
						<input type="text" size="8" name="vendorRecivedDate"
							id="vendorRecivedDate" readonly="readonly"
							value="<bean:write name="infoDateItem" property="vendorRecivedDate"/>">
					</logic:iterate> <img src="images/lich.JPG"
						onclick="javascript:NewCssCal('vendorRecivedDate','YYYYMMDD')">
					</td>
					<td width="20"></td>
					<td width="260">Date Adv to Client(dd/mm/yyyy) :</td>
					<td width="120" align="right"><input type="text" size="8">
					<html:img src="images/lich.JPG"
						onclick="javascript:NewCssCal('dateAdvtoClient','YYYYMMDD')" /></td>
				</tr>
				<tr class="tr">
					<td width="260">Expected Start Date (dd/mm/yyyy) :</td>
					<td width="150" align="right"><logic:iterate id="infoDateItem"
						name="infoDate">
						<html:hidden property="expectedStartDate"
							value="<%=arrUpdateScheduleDate.get(0).getExpectedStartDate() %>" />
						<bean:write name="infoDateItem" property="expectedStartDate" />
					</logic:iterate></td>
					<td width="20"></td>
					<td width="260">Expected End Date (dd/mm/yyyy) :</td>
					<td width="120" align="right"><logic:iterate id="infoDateItem"
						name="infoDate">
						<html:hidden property="expectedEndDate"
							value="<%=arrUpdateScheduleDate.get(0).getExpectedEndDate() %>" />
						<bean:write name="infoDateItem" property="expectedEndDate" />
					</logic:iterate></td>
				</tr>
				<tr class="tr">
					<td width="260">Actual Start Date (dd/mm/yyyy) :</td>
					<td width="150" align="right"><input type="text" size="8"
						name="actualStartDate" readonly="readonly"> <img
						src="images/lich.JPG"
						onclick="javascript:NewCssCal('actualStartDate','YYYYMMDD')">
					</td>
					<td width="20"></td>
					<td width="260">Actual End Date (dd/mm/yyyy) :</td>
					<td width="120" align="right"><input type="text" size="8"
						readonly="readonly" value="" /> <img src="images/lich.JPG"
						onclick="javascript:NewCssCal('actualEndDate','YYYYMMDD')"></td>
				</tr>
				<tr class="tr">
					<td width="260">Is Terminated ? :</td>
					<td width="150" align="right"><input type="checkbox"
						name="isTerminated" /></td>
					<td width="20"></td>
					<td width="260">Number of Vendor Staff Assigned<font
						color="red">*</font> :</td>
					<td width="120" align="right"><input type="text"
						name="numberofVendorStaffAssigned" size="3" /></td>
				</tr>
				<tr class="tr">
					<td width="260">Vendor Turnaround Time (Day) :</td>
					<td width="150" align="right"><input type="text"
						disabled="disabled" readonly="readonly" size="3"
						name="vendorTurnaroundTime" value="" /></td>
					<td width="20"></td>
					<td width="260">Turnaround Time (Day) :</td>
					<td width="120" align="right"><input type="text"
						disabled="disabled" readonly="readonly" size="3"
						name="turnAroundTime" value="" /></td>
				</tr>
			</table>
			<table width="435">
				<tr class="tr">
					<td valign="top" width="60">Remarks :</td>
					<td width="345" align="right"><textarea rows="3" cols="30"
						name="remarks"></textarea></td>
				</tr>
			</table>
			<table width="950">
				<tr>
					<td align="center"><input type="reset" value="   Clear   " />
					<input type="submit" value=" Update "
						onclick="return updateSubmit();" /> <input type="submit"
						value="Terminated" /> <input type="submit" value=" Cancel "
						onclick="return cancelSubmit()" /></td>
				</tr>
			</table>
			</div>
			</td>
		</tr>
	</table>
	<%
		}
	%>
</html:form>
</body>
</html:html>