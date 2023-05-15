import 'package:flutter/material.dart';
//이용구

class HomePage2 extends StatelessWidget {
  const HomePage2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(25, 40, 25, 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '너! 내 동료',
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.black,
                      size: 35,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              Container(
                padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: Column(
                  children: [

                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('인기모집', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
                        ],
                      ),
                    ),


                    SizedBox(height: 10),

                    Container( //옆으로 스크롤 하기 위한 컨테이너
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [

                            //hotbox
                            Hotbox('네이버 입사 예정자 모집', '같이 프로젝트 할 전우재 구합니다. 엄준식 학생 있습니다', 'Server'),
                            SizedBox(width: 10),

                            Hotbox('카카오 딱 대!', '1년 전통을 자랑하는 카카오 딱 대! 가짜 아닙니다! 이거 진짜야~', 'Web'),
                            SizedBox(width: 10),

                            Hotbox('자네 이미지는 이미 지났나? 깔깔', '웃었다면 지금 당장 지원하세요!', 'Image'),
                            SizedBox(width: 10),

                          ],
                        ),
                      ),
                    ),



                    SizedBox(height: 30),

                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text('즐겨찾는 게시판', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,),),
                        ],
                      ),
                    ),

                    SizedBox(height: 10),

                    Container(
                      height: 600, //길이 늘려서 반응형 확인하기
                      // 패딩 속성
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xffb2b2b2),
                            blurRadius: 5,
                            spreadRadius: 1,
                          ),
                        ],

                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),

                        border: Border.all(
                          color: Colors.black,
                          width: 1,
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('더 보기 > ', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold, color: Colors.red)),
                                  SizedBox(width: 5),
                                ],
                              )),
                          SizedBox(height: 20),

                          board('공모전 게시판',"메타버스와 ai의 혁신은 계속된다 이것은 4차선업은 혁신 그자체!!!"),
                          SizedBox(height: 17,),
                          board('동표 모집 게시판','네이버 입사 예정자 모집합니다 전 우재 입니다. 엄 준식'),
                          SizedBox(height: 17,),
                          board('진로 게시판',' 다들 스펙 어떻게 되시나요 저는 토익 900점에 여러가지 공모전을 했씁니다'),
                          SizedBox(height: 17,),
                          board('취업 정보 게시판', '정보처리가사 2차 필시기험 날짜는 x월 xx일입니다 잊지말고 신청하세요'),
                          SizedBox(height: 17,),

                        ],
                      ),
                    ),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


  //인기모집 박스 위젯 틀
  Widget Hotbox(String name, String content, String detail){
    return Container(
      width: 220,
      height: 180,
      // 패딩 속성
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(5),

      decoration: BoxDecoration(

        boxShadow: [
          BoxShadow(
            color: Color(0xffb2b2b2),
            blurRadius: 5,
            spreadRadius: 1,
          ),
        ],

        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),

        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Text('Hot', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.red),),
              SizedBox(width: 10),
              Expanded(child: Text(name)),
            ],
          ),
          SizedBox(height: 40),
          Expanded(child: Text(content,style: TextStyle(fontSize: 13),)),


          Row(
            //mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 30,

                padding: EdgeInsets.all(4),

                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.all(Radius.circular(70),),
                  border: Border.all(color: Colors.black12, width: 1,),
                ),
                child: Text(detail,textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15,),),
              ),
            ],
          ),

        ],
      ),
    );
  }

//즐겨 찾는 게시판 부분 위젯 틀
  Widget board(String name, String content){
    return  Center(
        child: Container(
          height: 25,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Text(name, style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black)),
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    width: 3,
                  )),
              Expanded(
                  flex: 20,
                  child: Container(
                      child: Text(
                        content,
                        style: TextStyle(fontSize: 13, color: Colors.black),
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                      )
                  ))
            ],
          ),
        ));
  }

}
