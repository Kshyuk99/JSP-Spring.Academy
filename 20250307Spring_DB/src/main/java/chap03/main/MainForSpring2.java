package chap03.main;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.time.LocalDateTime;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import chap03.config.AppCtx;
import chap03.spring.ChangePasswordService;
import chap03.spring.DuplicateMemberException;
import chap03.spring.Member;
import chap03.spring.MemberDao;
import chap03.spring.MemberListPrinter;
import chap03.spring.MemberNotFoundException;
import chap03.spring.MemberRegisterService;
import chap03.spring.RegisterRequest;
import chap03.spring.WrongIdPasswordException;

public class MainForSpring2 {

	private static ApplicationContext ctx = null;
	
	public static void main(String[] args) throws IOException {
		ctx = new AnnotationConfigApplicationContext(AppCtx.class);
		MemberDao memberDao = ctx.getBean(MemberDao.class);
		Member member = new Member("kim@korea.com", "1234", "홍길동", LocalDateTime.now());
		memberDao.insert(member);
		System.out.println("입력 성공!");
		
	}

	
}