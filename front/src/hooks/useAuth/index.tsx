"use client";

import { atom, useRecoilState } from "recoil";

import { axiosClient, getToken } from "@/lib";
import { IUser } from "@/types";

export const useAuth = () => {
  const [user, setUser] = useRecoilState<IUser>(userState);

  const autoLogin = async () => {
    const token = getToken();
    if (!token || user.uuid !== "") return;

    try {
      const res = await axiosClient().get("/auth/validate_token");
      if (res.status !== 200 || !res.data.success) return;
      setUser(res.data.user);
    } catch (error) {
      console.error(error);
    }
  };

  return { autoLogin };
};

export const userState = atom<IUser>({
  key: "userState",
  default: {
    uuid: "",
    name: "",
  },
});
