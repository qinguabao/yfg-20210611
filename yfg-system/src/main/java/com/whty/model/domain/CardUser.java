package com.whty.model.domain;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import com.yfg.common.core.domain.BaseEntity;

import java.beans.Transient;
import java.util.Date;

/**
 * 制卡表 col_card_user
 * 
 * @author mario
 * @date 2019-03-26
 */
public class CardUser extends BaseEntity
{
	private static final long serialVersionUID = 1L;
	
	/** id */
	private Integer id;
	/** 申请人姓名 */
	private String applyName;
	/** 学生证号码 */
	private String applyNumber;
	/** 身份证号码 */
	private String idCardNum;
	/** 性别 */
	private String gender;
	/** 优惠卡类型；0:学生卡，1:老年卡 */
	private Integer specialCardInfo;
	/** 申请时间 */
	private Date applyTime;
	/** 申请状态；0:申请中;1:审核通过;2:审核不通过 */
	private String applyStatus;
	/** 申请方式;0:微信;1:支付宝;2:PC端 */
	private String applyType;
	/** 支付订单号 */
	private String orderCode;
	/** 支付金额 */
	private Integer payAmount;
	/** 支付状态;0:已支付;1:未支付;2:支付失败 */
	private String payStatus;
	/** 联系人电话 */
	private String connectTelphone;
	/** 联系人手机 */
	private String connectMobile;
	/** 支付申请时间 */
	private Date payTime;
	/** 支付完成时间 */
	private Date payCompleteTime;
	/** 支付方式;0:微信;1:支付宝 */
	private String payType;
	/** 邮寄自取;00:邮寄;01:自取 */
	private String mailType;
	/** 快递公司 */
	private String companyName;
	/** 快递单号 */
	private String mailNo;
	/** 驳回原因 */
	private String rejectInfo;
	/** 更新时间 */
	private Date updateDate;
	/** 审核时间 */
	private Date checkDate;
	/** 身份证、户口本 */
	private String imageOne;
	/** 证件 */
	private String imageTwo;
	/** 制卡图片 */
	private String imageThree;
	/** 备用 */
	private String imageFour;
	/** 制卡图片备用 */
	private String imageFive;
	/** 是否充值;0:是;1:否 */
	private String chargeInfo;
	/** 充值金额 */
	private Integer chargeAmount;
	/** 卡号 */
	private String cardNum;
	/** 卡费用 */
	private Integer cardFee;
	/** 与申请人关系 */
	private String relationToApply;
	/** 代办人姓名 */
	private String agentName;
	/** 代办人电话 */
	private String agentMobile;
	/** 代办人地址 */
	private String agentAddress;
	/** 信息填写人 */
	private Integer frontUserId;
	/** 收件地址id */
	private Integer addressId;
	/** 自取网点 */
	private Integer stationId;
	/** 学校信息 */
	private Integer schoolInfo;
	/** 导出次数 */
	private Integer exportTimes;
	/** 备注 */
	private String remark;
	/** 备用字段1 */
	private String backupOne;
	/** 备用字段2 */
	private String backupTwo;
	/** 备用字段3 */
	private String backupThree;
	/** 审核人*/
	private int checkUser;

	/** 接收申请时间搜索条件*/
    private String startTime;
    private String endTime;
    /** 接收审核时间搜索条件*/
    private String startUpdateTime;
    private String endUpdateTime;
    /** 接收申请时间*/
    private String applyTimeStr;
    /** 接收支付申请时间*/
    private String payTimeStr;
    /** 接收支付完成时间*/
    private String payCompleteTimeStr;
    /** 接收更新时间*/
    private String updateDateStr;
    /** 接收审核时间*/
    private String checkDateStr;
	public void setId(Integer id) 
	{
		this.id = id;
	}

	public Integer getId() 
	{
		return id;
	}
	public void setApplyName(String applyName) 
	{
		this.applyName = applyName;
	}

	public String getApplyName() 
	{
		return applyName;
	}
	public void setApplyNumber(String applyNumber) 
	{
		this.applyNumber = applyNumber;
	}

	public String getApplyNumber() 
	{
		return applyNumber;
	}
	public void setIdCardNum(String idCardNum) 
	{
		this.idCardNum = idCardNum;
	}

	public String getIdCardNum() 
	{
		return idCardNum;
	}
	public void setGender(String gender) 
	{
		this.gender = gender;
	}

	public String getGender() 
	{
		return gender;
	}
	public void setSpecialCardInfo(Integer specialCardInfo) 
	{
		this.specialCardInfo = specialCardInfo;
	}

	public Integer getSpecialCardInfo() 
	{
		return specialCardInfo;
	}
	public void setApplyTime(Date applyTime) 
	{
		this.applyTime = applyTime;
	}

	public Date getApplyTime() 
	{
		return applyTime;
	}
	public void setApplyStatus(String applyStatus) 
	{
		this.applyStatus = applyStatus;
	}

	public String getApplyStatus() 
	{
		return applyStatus;
	}
	public void setApplyType(String applyType) 
	{
		this.applyType = applyType;
	}

	public String getApplyType() 
	{
		return applyType;
	}
	public void setOrderCode(String orderCode) 
	{
		this.orderCode = orderCode;
	}

	public String getOrderCode() 
	{
		return orderCode;
	}
	public void setPayAmount(Integer payAmount) 
	{
		this.payAmount = payAmount;
	}

	public Integer getPayAmount() 
	{
		return payAmount;
	}
	public void setPayStatus(String payStatus) 
	{
		this.payStatus = payStatus;
	}

	public String getPayStatus() 
	{
		return payStatus;
	}
	public void setConnectTelphone(String connectTelphone) 
	{
		this.connectTelphone = connectTelphone;
	}

	public String getConnectTelphone() 
	{
		return connectTelphone;
	}
	public void setConnectMobile(String connectMobile) 
	{
		this.connectMobile = connectMobile;
	}

	public String getConnectMobile() 
	{
		return connectMobile;
	}
	public void setPayTime(Date payTime) 
	{
		this.payTime = payTime;
	}

	public Date getPayTime() 
	{
		return payTime;
	}
	public void setPayCompleteTime(Date payCompleteTime) 
	{
		this.payCompleteTime = payCompleteTime;
	}

	public Date getPayCompleteTime() 
	{
		return payCompleteTime;
	}
	public void setPayType(String payType) 
	{
		this.payType = payType;
	}

	public String getPayType() 
	{
		return payType;
	}
	public void setMailType(String mailType) 
	{
		this.mailType = mailType;
	}

	public String getMailType() 
	{
		return mailType;
	}
	public void setCompanyName(String companyName) 
	{
		this.companyName = companyName;
	}

	public String getCompanyName() 
	{
		return companyName;
	}
	public void setMailNo(String mailNo) 
	{
		this.mailNo = mailNo;
	}

	public String getMailNo() 
	{
		return mailNo;
	}
	public void setRejectInfo(String rejectInfo) 
	{
		this.rejectInfo = rejectInfo;
	}

	public String getRejectInfo() 
	{
		return rejectInfo;
	}
	public void setUpdateDate(Date updateDate) 
	{
		this.updateDate = updateDate;
	}

	public Date getUpdateDate() 
	{
		return updateDate;
	}
	public void setCheckDate(Date checkDate) 
	{
		this.checkDate = checkDate;
	}

	public Date getCheckDate() 
	{
		return checkDate;
	}
	public void setImageOne(String imageOne) 
	{
		this.imageOne = imageOne;
	}

	public String getImageOne() 
	{
		return imageOne;
	}
	public void setImageTwo(String imageTwo) 
	{
		this.imageTwo = imageTwo;
	}

	public String getImageTwo() 
	{
		return imageTwo;
	}
	public void setImageThree(String imageThree) 
	{
		this.imageThree = imageThree;
	}

	public String getImageThree() 
	{
		return imageThree;
	}
	public void setImageFour(String imageFour) 
	{
		this.imageFour = imageFour;
	}

	public String getImageFour() 
	{
		return imageFour;
	}
	public void setImageFive(String imageFive) 
	{
		this.imageFive = imageFive;
	}

	public String getImageFive() 
	{
		return imageFive;
	}
	public void setChargeInfo(String chargeInfo) 
	{
		this.chargeInfo = chargeInfo;
	}

	public String getChargeInfo() 
	{
		return chargeInfo;
	}
	public void setChargeAmount(Integer chargeAmount) 
	{
		this.chargeAmount = chargeAmount;
	}

	public Integer getChargeAmount() 
	{
		return chargeAmount;
	}
	public void setCardNum(String cardNum) 
	{
		this.cardNum = cardNum;
	}

	public String getCardNum() 
	{
		return cardNum;
	}
	public void setCardFee(Integer cardFee) 
	{
		this.cardFee = cardFee;
	}

	public Integer getCardFee() 
	{
		return cardFee;
	}
	public void setRelationToApply(String relationToApply) 
	{
		this.relationToApply = relationToApply;
	}

	public String getRelationToApply() 
	{
		return relationToApply;
	}
	public void setAgentName(String agentName) 
	{
		this.agentName = agentName;
	}

	public String getAgentName() 
	{
		return agentName;
	}
	public void setAgentMobile(String agentMobile) 
	{
		this.agentMobile = agentMobile;
	}

	public String getAgentMobile() 
	{
		return agentMobile;
	}
	public void setAgentAddress(String agentAddress) 
	{
		this.agentAddress = agentAddress;
	}

	public String getAgentAddress() 
	{
		return agentAddress;
	}
	public void setFrontUserId(Integer frontUserId) 
	{
		this.frontUserId = frontUserId;
	}

	public Integer getFrontUserId() 
	{
		return frontUserId;
	}
	public void setAddressId(Integer addressId) 
	{
		this.addressId = addressId;
	}

	public Integer getAddressId() 
	{
		return addressId;
	}
	public void setStationId(Integer stationId) 
	{
		this.stationId = stationId;
	}

	public Integer getStationId() 
	{
		return stationId;
	}
	public void setSchoolInfo(Integer schoolInfo) 
	{
		this.schoolInfo = schoolInfo;
	}

	public Integer getSchoolInfo() 
	{
		return schoolInfo;
	}
	public void setExportTimes(Integer exportTimes) 
	{
		this.exportTimes = exportTimes;
	}

	public Integer getExportTimes() 
	{
		return exportTimes;
	}
	public void setRemark(String remark) 
	{
		this.remark = remark;
	}

	public String getRemark() 
	{
		return remark;
	}
	public void setBackupOne(String backupOne) 
	{
		this.backupOne = backupOne;
	}

	public String getBackupOne() 
	{
		return backupOne;
	}
	public void setBackupTwo(String backupTwo) 
	{
		this.backupTwo = backupTwo;
	}

	public String getBackupTwo() 
	{
		return backupTwo;
	}
	public void setBackupThree(String backupThree) 
	{
		this.backupThree = backupThree;
	}

	public String getBackupThree() 
	{
		return backupThree;
	}
	@Transient
    public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	@Transient
	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	@Transient
	public String getStartUpdateTime() {
		return startUpdateTime;
	}

	public void setStartUpdateTime(String startUpdateTime) {
		this.startUpdateTime = startUpdateTime;
	}
	@Transient
	public String getEndUpdateTime() {
		return endUpdateTime;
	}

	public void setEndUpdateTime(String endUpdateTime) {
		this.endUpdateTime = endUpdateTime;
	}

	public int getCheckUser() {
		return checkUser;
	}

	public void setCheckUser(int checkUser) {
		this.checkUser = checkUser;
	}
	@Transient
	public String getApplyTimeStr() {
		return applyTimeStr;
	}

	public void setApplyTimeStr(String applyTimeStr) {
		this.applyTimeStr = applyTimeStr;
	}
	@Transient
	public String getPayTimeStr() {
		return payTimeStr;
	}

	public void setPayTimeStr(String payTimeStr) {
		this.payTimeStr = payTimeStr;
	}
	@Transient
	public String getPayCompleteTimeStr() {
		return payCompleteTimeStr;
	}

	public void setPayCompleteTimeStr(String payCompleteTimeStr) {
		this.payCompleteTimeStr = payCompleteTimeStr;
	}
	@Transient
	public String getUpdateDateStr() {
		return updateDateStr;
	}

	public void setUpdateDateStr(String updateDateStr) {
		this.updateDateStr = updateDateStr;
	}
	@Transient
	public String getCheckDateStr() {
		return checkDateStr;
	}

	public void setCheckDateStr(String checkDateStr) {
		this.checkDateStr = checkDateStr;
	}

	public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("applyName", getApplyName())
            .append("applyNumber", getApplyNumber())
            .append("idCardNum", getIdCardNum())
            .append("gender", getGender())
            .append("specialCardInfo", getSpecialCardInfo())
            .append("applyTime", getApplyTime())
            .append("applyStatus", getApplyStatus())
            .append("applyType", getApplyType())
            .append("orderCode", getOrderCode())
            .append("payAmount", getPayAmount())
            .append("payStatus", getPayStatus())
            .append("connectTelphone", getConnectTelphone())
            .append("connectMobile", getConnectMobile())
            .append("payTime", getPayTime())
            .append("payCompleteTime", getPayCompleteTime())
            .append("payType", getPayType())
            .append("mailType", getMailType())
            .append("companyName", getCompanyName())
            .append("mailNo", getMailNo())
            .append("rejectInfo", getRejectInfo())
            .append("updateDate", getUpdateDate())
            .append("checkDate", getCheckDate())
            .append("imageOne", getImageOne())
            .append("imageTwo", getImageTwo())
            .append("imageThree", getImageThree())
            .append("imageFour", getImageFour())
            .append("imageFive", getImageFive())
            .append("chargeInfo", getChargeInfo())
            .append("chargeAmount", getChargeAmount())
            .append("cardNum", getCardNum())
            .append("cardFee", getCardFee())
            .append("relationToApply", getRelationToApply())
            .append("agentName", getAgentName())
            .append("agentMobile", getAgentMobile())
            .append("agentAddress", getAgentAddress())
            .append("frontUserId", getFrontUserId())
            .append("addressId", getAddressId())
            .append("stationId", getStationId())
            .append("schoolInfo", getSchoolInfo())
            .append("exportTimes", getExportTimes())
            .append("remark", getRemark())
            .append("backupOne", getBackupOne())
            .append("backupTwo", getBackupTwo())
            .append("backupThree", getBackupThree())
            .append("checkUser", getCheckUser())
            .toString();
    }
}
