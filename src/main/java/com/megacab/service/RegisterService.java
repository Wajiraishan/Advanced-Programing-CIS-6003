package com.megacab.service;

import com.megacab.model.RegisterModel;
import com.megacab.repository.RegisterRepo;

public class RegisterService {
    
    private RegisterRepo registerRepo = new RegisterRepo();

    public String registerUser(RegisterModel registerModel) {
        return registerRepo.saveUser(registerModel);
    }
}
