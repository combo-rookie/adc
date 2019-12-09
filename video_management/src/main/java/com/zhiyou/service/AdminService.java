package com.zhiyou.service;

import javax.servlet.http.HttpServletRequest;

import com.zhiyou.model.Admin;

public interface AdminService {

	Admin selectByAccounts(HttpServletRequest req, String accounts, String password);

}
