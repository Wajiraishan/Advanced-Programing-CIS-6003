package com.megacab.model;

public class RegisterModel {
    private String name;
    private String nic;
    private String address;
    private String password;
    private boolean agree;

    public RegisterModel(String name, String nic, String address, String password, boolean agree) {
        this.name = name;
        this.nic = nic;
        this.address = address;
        this.password = password;
        this.agree = agree;
    }

    public String getName() {
        return name;
    }

    public String getNic() {
        return nic;
    }

    public String getAddress() {
        return address;
    }

    public String getPassword() {
        return password;
    }

    public boolean isAgree() {
        return agree;
    }
}
