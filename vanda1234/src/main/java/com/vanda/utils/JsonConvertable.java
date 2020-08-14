package com.vanda.utils;

import com.google.gson.GsonBuilder;

public class JsonConvertable {

	public String toJson() {
		return new GsonBuilder().setPrettyPrinting().create().toJson(this);
	}

	public JsonConvertable fromJson(String str) {
		if (str == null || str.length() == 0) {
			return this;
		}
		return new GsonBuilder().setPrettyPrinting().create().fromJson(str, this.getClass());
	}

	public JsonConvertable getClone() {
		return fromJson(toJson());
	}
}
