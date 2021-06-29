package com.vegetarian.ultil;
import com.vegetarian.entity.User;
import org.springframework.context.ApplicationEvent;

public class OnRegistrationCompleteEvent extends ApplicationEvent {
    private String appUrl;
    private String redirectLink;
    private User user;
    public OnRegistrationCompleteEvent(
            User user, String appUrl,String redirectLink) {
        super(user);
        this.user = user;
        this.appUrl = appUrl;
        this.redirectLink = redirectLink;
    }

    public String getAppUrl() {
        return appUrl;
    }

    public void setAppUrl(String appUrl) {
        this.appUrl = appUrl;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getRedirectLink() {
        return redirectLink;
    }

    public void setRedirectLink(String redirectLink) {
        this.redirectLink = redirectLink;
    }
}
