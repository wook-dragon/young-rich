//프로미스는 자바스크립트 비동기 처리에 사용되는 객체입니다. 
//여기서 자바스크립트의 비동기 처리란 특정 코드의 실행이 
//완료될 때까지 기다리지 않고 다음 코드를 먼저 수행하는 자바스크립트의 특성’을 의미합니다.
$.get('URL 주소/Products/1', function (response) {
   
  });

  function getData(callbackFunc) {
    $.get('URL 주소/Products/1', function (response) {
      callbackFunc(response); // 서버에서 받은 데이터 response를 callbackFunc() 함수에 넘긴다.
    });
  }
  
  getData(function (tableData) {
    console.log(tableData); // $.get()의 response 값이 tableData에 전달함
  });

  function getData(callback) {
    // new Promise() 추가한다.
    return new Promise(function (resolve, reject) {
      $.get('URL 주소/Products/1', function (response) {
        // 데이터를 받으면 resolve()을 호출한다.
        resolve(response);
      });
    });
  }
  
  // getData()의 실행이 끝나면 호출되는 then()
  getData().then(function (tableData) {
    // resolve()의 결과값이 여기로 전달함
    console.log(tableData); // $.get()의 reponse 값이 tableData에 전달됨
  });

//Pending(대기) : 비동기 처리 로직이 아직 완료되지 않은 상태
//Fulfilled(이행) : 비동기 처리가 완료되어 프로미스가 결과 값을 반환해준 상태
//Rejected(실패) : 비동기 처리가 실패하거나 오류가 발생한 상태

//pending (대기)
new Promise();

//Fulfilled (이행)
new Promise(function (resolve, reject) {
    resolve();
  });

// 이행상태가 되면
  function getData() {
    return new Promise(function (resolve, reject) {
      var data = 100;
      resolve(data);
    });
  }
  
  // resolve()의 결과 값 data를 resolvedData로 받음
  getData().then(function (resolvedData) {
      //then()을 이용하여 처리 결과 값을 받을 수 있다.
    console.log(resolvedData); // 100
  });

  //Rejected (실패)
  new Promise(function (resolve, reject) {
    reject();
  });

  // 실패 상태가 되면 실패 이유(실패 처리 결과값)를 catch()로 받을 수 있다.
  function getData() {
    return new Promise(function (resolve, reject) {
      reject(new Error("Request is failed"));
    });
  }
  
  // reject()의 결과 값 Error를 err에 받음
  getData().then().catch(function (err) {
    console.log(err); // Error: Request is failed
  });

  //예제코드
  function getData() {
    return new Promise(function (resolve, reject) {
      $.get('URL 주소/Products/1', function (response) {
        if (response) {
          resolve(response);
        }
        reject(new Error("Request is failed"));
      });
    });
  }
  
  // Fulfilled 또는 Rejected의 결과 값 출력
  getData().then(function (data) {
    console.log(data); // response 값 출력
  }).catch(function (err) {
    console.error(err); // Error 출력
  });
  //위 코드는 서버에서 제대로 응답을 받으면 resolve() 메소드를
  //호출하고 응답이 없으면 reject() 메소르를 호출하는 예제

  //여러개의 프로미스 연결
  //앞에 예제에서 then() 메소드를 호출하고 나면 새로운 프로미스
  //객체가 반환된다. 
  function getData() {
    return new Promise({
      // 코딩
    });
  }
  
  // then() 으로 여러 개의 프로미스를 연결한 형식
  getData()
    .then(function (data) {
      // 코딩
    })
    .then(function () {
      // 코딩
    })
    .then(function () {
      // 코딩
    });

    //위 형식을 참고하여 비동기 처리예제에서 흔히 사용하는
    //setTimeout() API 사용
    new Promise(function(resolve, reject){
        setTimeout(function() {
          resolve(1);
        }, 2000);
      })
      .then(function(result) {
        console.log(result); // 1 첫번째 then()에서 이행된 값 1
        return result + 10; //1 에서 10을 더한 뒤
      })
      .then(function(result) {
        console.log(result); // 11 // 첫번째에서 넘긴 then의 값 11
        return result + 20; //11 에서 20을 더한 뒤
      })
      .then(function(result) { 
        console.log(result); // 31 2번째 then()에서 넘긴 값 31
      });

    // 여러개 프로미스 연결하기
    // Promise Chaining
      function getData() {
        return new Promise({
          // 코딩
        });
      }
      
      // then() 으로 여러 개의 프로미스를 연결한 형식
      getData()
        .then(function (data) {
          //코딩
        })
        .then(function () {
         //코딩
        })
        .then(function () {
         // 코딩
        });

        //웹 서비스 로그인 로직
        getData(userInfo) //사용자 정보가 담긴 객체
        .then(parseValue)
        .then(auth)
        .then(diaplay); 

        var userInfo = {
            id: 'test@naver.com',
            pw: '****'
          };
          
          function parseValue() {
            return new Promise({
              // 코딩
            });
          }
          function auth() {
            return new Promise({
              // 코딩
            });
          }
          function display() {
            return new Promise({
              // 코딩
            });
          }

          //에러 처리방법
          //1. then()의 두 번째 인자로 에러 처리
          getData().then(
            handleSuccess,
            handleError
          );

          //2. catch() 이용하는 방법
          getData().then().catch();

          //2가지 방법 모두 프로미스의 reject() 메소드가 호출되어
          //실패한 상태가 된 경우에 실행됩니다. 
          // 프로미스의 로직 정상적으로 돌아가지 않는 경우 호출

          //예제
          function getData() {
            return new Promise(function (resolve, reject) {
              reject('failed');
            });
          }
          
          // 1. then()으로 에러를 처리하는법
          getData().then(function () {
            // 코딩
          }, function (err) {
            console.log(err);
          });
          
          // 2. catch()로 에러를 처리하는법
          getData().then().catch(function (err) {
            console.log(err);
          });

          //에러처리는 catch로 하는게 좋다.
          //then()의 두번째 인자로 처리하는거보다
          //catch()로 처리하는게 효율적이다.

          // then()의 두 번째 인자로는 감지하지 못하는 오류 예제
        function getData() {
            return new Promise(function (resolve, reject) {
            resolve('hi');
            });
        }
        
        getData().then(function (result) {
            console.log(result);
            throw new Error("Error in then()"); // Uncaught (in promise) Error: Error in then()
        }, function (err) {
            console.log('then error : ', err);
        });
          
        // 위 코드 catch로 잡은 예제
        // catch()로 오류를 감지하는 코드
        function getData() {
            return new Promise(function (resolve, reject) {
            resolve('hi');
            });
        }
        
        getData().then(function (result) {
            console.log(result); // hi
            throw new Error("Error in then()");
        }).catch(function (err) {
            console.log('then error : ', err); // then error :  Error: Error in then()
        });