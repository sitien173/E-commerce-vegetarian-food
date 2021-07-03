package com.vegetarian.entity;
import org.hibernate.validator.constraints.NotBlank;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import javax.validation.constraints.Pattern;
import java.io.Serializable;
import java.sql.Date;
import java.util.List;
import java.util.Set;

public class User  implements Serializable, UserDetails {
    @NotBlank(message = "name not null or empty")
    private String name;
    @NotBlank(message = "username not null or empty")
    private String username;
    @NotBlank(message = "email not null or empty")
    @Pattern(regexp = "^[a-z][a-z0-9_\\.]{5,32}@[a-z0-9]{2,}(\\.[a-z0-9]{2,4}){1,2}$",message = "Incorrect email format")
    private String email;
    @NotBlank(message = "password not null or empty")
    @Pattern(regexp = "^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$" ,message = "Password must include uppercase and lowercase letters and up to 8 characters")
    private String password;
    @Pattern(regexp = "\\(?([0-9]{3})\\)?([ .-]?)([0-9]{3})\\2([0-9]{4})",message = "The phone number is not in the correct format")
    private String phone;
    private String avatar;
    private Address address;
    private Date createdAt;
    private Set<SimpleGrantedAuthority> grantedAuthorities;
    private boolean isEnable;

    public User() {
    }

    public User(String name, String username, String email, String password, String phone, String avatar, Address address,Date createdAt, Set<SimpleGrantedAuthority> grantedAuthorities, boolean isEnable) {
        this.name = name;
        this.username = username;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.avatar = avatar;
        this.address = address;
        this.createdAt = createdAt;
        this.grantedAuthorities = grantedAuthorities;
        this.isEnable = isEnable;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAvatar() {
        return avatar;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    @Override
    public String getUsername() {
        return username;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return isEnable;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public Set<SimpleGrantedAuthority> getAuthorities() {
        return this.grantedAuthorities;
    }

    @Override
    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public void setGrantedAuthorities(Set<SimpleGrantedAuthority> grantedAuthorities) {
        this.grantedAuthorities = grantedAuthorities;
    }

    public void setEnable(boolean enable) {
        isEnable = enable;
    }
}
