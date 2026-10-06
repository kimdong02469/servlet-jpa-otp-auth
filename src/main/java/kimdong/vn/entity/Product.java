package kimdong.vn.entity;

import jakarta.persistence.*;
import java.io.Serializable;

@Entity
@Table(name = "Products")
@NamedQuery(name = "Product.findAll", query = "SELECT p FROM Product p")
public class Product implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "ProductId")
	private int productId;

	@Column(name = "ProductName", length = 255, nullable = false)
	private String productName;

	// Sửa NVARCHAR(MAX) thành TEXT chuẩn MySQL
	@Column(name = "Description", columnDefinition = "TEXT")
	private String description;

	@Column(name = "Price")
	private double price;

	@Column(name = "Images", length = 500)
	private String images;

	// Đổi sang FetchType.EAGER để nạp kèm Category mà không bị ngắt session
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "CategoryId")
	private Category category;

	public Product() {
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getPrice() {
		return price;
	}

	public void setPrice(double price) {
		this.price = price;
	}

	public String getImages() {
		return images;
	}

	public void setImages(String images) {
		this.images = images;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}
}