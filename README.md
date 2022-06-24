# Solar-power-generation-forecast
DATA SCIENCE

기상 정보를 통한 태양광 발전량 

사용한 데이터셋 : 당진 발전소의 발전량, 기온, 습도, 풍향, 풍속, 전운량

![image](https://user-images.githubusercontent.com/74047671/175527946-f606a4e0-2488-49d0-a9e2-f42c986c488d.png)

전처리 전

![image](https://user-images.githubusercontent.com/74047671/175527982-de54e393-a1fe-4604-827c-d12740533a9a.png)

![image](https://user-images.githubusercontent.com/74047671/175528126-79f78c4a-0398-45fc-a810-fec3b75f842f.png)


전처리 후

![image](https://user-images.githubusercontent.com/74047671/175528164-54de602f-a1d5-4e93-b476-a0d00dee1360.png)

![image](https://user-images.githubusercontent.com/74047671/175528150-c2d4ec5b-c8dc-4f17-a0cf-10459d0cfcc4.png)

![image](https://user-images.githubusercontent.com/74047671/175528005-fdb0c5e3-b204-49a4-ac52-1bc133f787bd.png)

![image](https://user-images.githubusercontent.com/74047671/175528144-78307eaa-e206-4ceb-a0f8-74234bba77a5.png)


이상치는 평균으로, 결측치는 선형보간으로 채움

기상 데이터셋과 발전량 데이터셋을 합침

![image](https://user-images.githubusercontent.com/74047671/175528329-387d636b-9154-4056-ad2f-bba59d22b5c7.png)

![image](https://user-images.githubusercontent.com/74047671/175528336-cf810691-3257-4cb6-b0e6-e52ec6da1d64.png)

Train : Test = 8 : 2

![image](https://user-images.githubusercontent.com/74047671/175528378-43941f9a-f119-430d-bb01-d43481f96e9e.png)

Base line

![image](https://user-images.githubusercontent.com/74047671/175528417-c2c84db7-3586-4112-a4b0-2ba5432f280c.png)

TestRMSE

![image](https://user-images.githubusercontent.com/74047671/175528443-b083b5e3-19a0-43a6-ae8d-406a88db850b.png)

![image](https://user-images.githubusercontent.com/74047671/175528455-75a5b1f9-19a7-4788-b926-e88c7138998f.png)

Base line + interaction term

![image](https://user-images.githubusercontent.com/74047671/175528516-8fe255a0-1bcd-424f-bbab-22e667635a7b.png)

![image](https://user-images.githubusercontent.com/74047671/175528528-6f5e5d81-4f07-4111-9d31-23449b56314a.png)

![image](https://user-images.githubusercontent.com/74047671/175528559-50dd72ab-c521-4bde-b18d-a2df1585e2bd.png)

Base line + n degree polynomial term

![image](https://user-images.githubusercontent.com/74047671/175528711-3a8a1042-1e1d-4e43-abed-27a35cf18c75.png)

![image](https://user-images.githubusercontent.com/74047671/175528725-5af0376a-49a7-4397-b560-784c597799a1.png)

![image](https://user-images.githubusercontent.com/74047671/175528752-79163972-d3b4-46e3-9130-a1d5de92c0e0.png)

![image](https://user-images.githubusercontent.com/74047671/175528761-bb9be384-03ec-44b6-9e28-d63482935306.png)

![image](https://user-images.githubusercontent.com/74047671/175528771-54628b26-9b5f-4fb3-9dd9-f69659e09555.png)

![image](https://user-images.githubusercontent.com/74047671/175528784-b4786c21-ed64-4682-ae89-636a9a43a3a5.png)

![image](https://user-images.githubusercontent.com/74047671/175528796-a7f1d307-6c04-4ca7-b259-06949655452a.png)

![image](https://user-images.githubusercontent.com/74047671/175528808-eae8737e-6101-4e46-b1bc-744171cade67.png)

![image](https://user-images.githubusercontent.com/74047671/175528813-ee556742-b0c6-48fb-be60-090754cf087d.png)

![image](https://user-images.githubusercontent.com/74047671/175528833-9ca4cc8c-1d15-4f59-bbd9-d46abb0896a1.png)

![image](https://user-images.githubusercontent.com/74047671/175528867-440ae180-7b6a-4331-a6bd-e43852d911f4.png)

![image](https://user-images.githubusercontent.com/74047671/175528891-08fc11fd-267f-41bb-9a00-3593ddb5094c.png)

![image](https://user-images.githubusercontent.com/74047671/175528919-80da0b48-c956-4639-861e-15ea75ec5be9.png)

![image](https://user-images.githubusercontent.com/74047671/175528944-96f3357b-4fee-44ca-95c5-20ed0c580604.png)
