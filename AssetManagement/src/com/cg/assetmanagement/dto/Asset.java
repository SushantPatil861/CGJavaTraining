package com.cg.assetmanagement.dto;

import java.time.LocalDate;

import javax.persistence.Convert;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.annotations.Type;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.NumberFormat;

/**
 * Description:AssetDto
 * 
 * @author pshandi1
 *
 */
@Entity
@Table(name = "asset_master")
public class Asset {
	@Id
	@SequenceGenerator(name = "assetSeq", sequenceName = "asset_id_seq")
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "assetSeq")
	private Integer assetId;
	@Pattern(regexp = "[A-Za-z0-9]+[\\sA-Za-z0-9]*", message = "Name must contain Numbers and Characters only and must not be empty")
	private String assetName;
	@NotNull(message="PurchaseDate must not be empty")
	@Convert(converter = LocalDateConverter.class)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	LocalDate purchaseDate;
	@NotNull
	@Min(value=0,message="UnitPrice must not be empty or negative")
	private Double unitPrice;
	@NotEmpty(message="AssetType must not be empty")
	private String assetType;
	@NotEmpty(message="Category must not be empty")
	private String category;
	@NotNull
	@Min(value=1,message="Quantity must not be empty or less than 1")
	private Integer quantity;
	@NotEmpty(message="Description must not be empty")
	private String assetDes;

	public String getAssetName() {
		return assetName;
	}

	public void setAssetName(String assetName) {
		this.assetName = assetName;
	}

	public Integer getAssetId() {
		return assetId;
	}

	public void setAssetId(Integer assetId) {
		this.assetId = assetId;
	}

	public LocalDate getPurchaseDate() {
		return purchaseDate;
	}

	public void setPurchaseDate(LocalDate purchaseDate) {
		this.purchaseDate = purchaseDate;
	}

	public Double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}

	public String getAssetType() {
		return assetType;
	}

	public void setAssetType(String assetType) {
		this.assetType = assetType;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public String getAssetDes() {
		return assetDes;
	}

	public void setAssetDes(String assetDes) {
		this.assetDes = assetDes;
	}

	@Override
	public String toString() {
		return "Asset [assetId=" + assetId + ", assetName=" + assetName
				+ ", purchaseDate=" + purchaseDate + ", unitPrice=" + unitPrice
				+ ", assetType=" + assetType + ", category=" + category
				+ ", quantity=" + quantity + ", assetDes=" + assetDes + "]";
	}

}
