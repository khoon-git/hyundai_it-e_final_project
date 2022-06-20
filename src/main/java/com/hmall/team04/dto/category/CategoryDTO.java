package com.hmall.team04.dto.category;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CategoryDTO {
	private String category_id;
	private String category_name;
	private int parent_lev;
	private int parent_detail_lev;
	private int cate_detail_lev;
}
