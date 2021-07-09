package com.vegetarian.entity;

import org.hibernate.validator.constraints.NotBlank;

public class Category {
    private int id;
    @NotBlank(message = "Name not is empty")
    private String name;
    @NotBlank(message = "Slug not is empty")
    private String slug;

    public Category() {
    }

    public Category(int id, String name, String slug) {
        this.id = id;
        this.name = name;
        this.slug = slug;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSlug() {
        return slug;
    }

    public void setSlug(String slug) {
        this.slug = slug;
    }
}
