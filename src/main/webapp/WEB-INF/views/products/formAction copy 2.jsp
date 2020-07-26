<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="en">
    
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
        <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
    </head>
    
    
    
    
    
    <body>
    
        <div id='app'>
            <form @submit.prevent="submitForm">
                <input :value="subject" @input="subject=$event.target.value" placeholder="제목">
                <p>제목: {{ subject }}</p>
                <input :value="author" @input="author=$event.target.value" placeholder="저자">
                <p>저자: {{ author }}</p>
                <input v-model.number.trim="price" @input="maxLengthCheck" placeholder="가격" type="number">
                <p>가격: {{ price }}</p>
                <textarea :value="content" @input="content=$event.target.value" placeholder="내용"></textarea>
                <p>내용: {{ content }}</p>
                <button type="submit">등록</button>
    
            </form>
        </div>
    
    
        <div id="imageApp">
            <form @submit.prevent="imageUpload">
                <!-- <form action="https://www.w3schools.com/action_page.php" method="GET"> -->
                <input type="file" @change="onFileChange" accept="image/*">
    
                <div id="preview" @dragover.prevent @dragenter.prevent @drop.prevent="onDrop">
                    <img v-if="url" :src="url">
                    <!-- <img :src="url"> -->
    
                </div>
                <Button type="submit">사진업로드</Button>
            </form>
        </div>
    
        <style>
            #preview {
                display: flex;
                justify-content: center;
                align-items: center;
                width: 500px;
                height: 500px;
                background-color: black;
            }
    
            #preview img {
                max-width: 100%;
                max-height: 500px;
            }
        </style>
    
        <div id='viewBook'>
            <form @submit.prevent="">
                <label for="subject"><b>도서제목</b></label>
                <input :value="subject" @input="subject=$event.target.value" placeholder="제목"><br>
                <label for="author"><b>저자</b></label>
                <input :value="author" @input="author=$event.target.value" placeholder="저자"><br>
                <label for="subject"><b>가격</b></label>
                <input v-model.number.trim="price" placeholder="가격" type="number"><br>
                <label for="subject"><b>도서내용</b></label><br>
                <textarea :value="content" @input="content=$event.target.value" placeholder="내용"></textarea>
                <button @click="clearForm">닫기</button>
                <button @click="update">수정</button>
            </form>
        </div>
    
        <div id='mainTab' class="table-responsive">
            <table class="table table-striped">
                <thead class="thead-inverse">
                    <tr>
                        <th>번호</th>
                        <th>사진</th>
                        <th>제목</th>
                        <th>가격</th>
                        <th>삭제</th>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="post in posts">
                        <td>{{post.bookUid}}</td>
                        <td></td>
                        <td><button @click="viewItem">{{post.subject}}</button></td>
                        <td>{{post.price}}</td>
                        <td><button @click="deleteItem">삭제</button></td>
                    </tr>
                </tbody>
            </table>
        </div>
    
        <script>
            Vue.prototype.EventBus = new Vue(); // Vue에 등록
    
            let imageApp = new Vue({
                el: '#imageApp',
                data: {
                    file: null,
                    url: null,
                },
                methods: {
                    onFileChange(e) {
                        console.log(this.file);
                        const file = e.target.files[0];
                        this.file = file;
                        this.url = URL.createObjectURL(file);
                        console.log(this.file);
                    },
                    onDrop(e) {
                        console.log(this.file);
                        const file = e.dataTransfer.files[0];
                        this.file = file;
                        this.url = URL.createObjectURL(file);
                        console.log(this.file);
                    },
                    imageUpload() {
                        let formData = new FormData();
                        formData.append('file', this.file);
                        console.log(formData);
                        console.log(this.file);
    
                        axios.post('http://localhost:8109/yes25_project/products/ajax/upload.ajax',
                                formData, {
                                    headers: {
                                        'Content-Type': 'multipart/form-data'
                                    }
                                }).then(function () {
                                console.log('SUCCESS!!');
                            })
                            .catch(function () {
                                console.log('FAILURE!!');
                            });
    
                    }
                }
            });
    
            let app = new Vue({
                el: '#app',
                data: {
                    imageUrl: null,
                    subject: '',
                    author: '',
                    price: '',
                    content: ''
                },
                methods: {
                    clearForm: function () {
                        this.subject = '';
                        this.author = '';
                        this.price = '';
                        this.content = '';
                    },
                    maxLengthCheck: function (event) {
                        const value = event.target.value;
                        console.log(value, this.price);
                        if (String(value).length > 7) {
                            this.price = String(value).slice(0, 7);
                        }
    
                    },
                    submitForm: function () {
                        axios.post(`http://localhost:8109/yes25_project/products/ajax/insert.ajax`, {
                                "subject": this.subject,
                                "author": this.author,
                                "price": this.price,
                                "content": this.content,
                            })
                            .then((result) => {
                                console.log(result);
                                this.EventBus.$emit('refresh', 'hello');
                                this.clearForm();
                            })
                            .catch(error => {
                                console.log('failed', error)
                            });
    
                    }
                }
            });
    
            let app2 = new Vue({
                el: '#mainTab',
                data: {
                    posts: []
                },
                created() {
                    this.getList();
                    this.EventBus.$on('refresh', this.getList);
                },
                methods: {
                    getList: function () {
                        axios.get(`http://localhost:8109/yes25_project/products/ajax/list.ajax`, {
                                "page": 1
                            })
                            .then((result) => {
                                console.log(result);
                                this.posts = result.data;
                            })
                            .catch(error => {
                                console.log('failed', error)
                            });
    
                    },
                    viewItem: function (event) {
                        axios.post(`http://localhost:8109/yes25_project/products/ajax/view.ajax`, {
                                "bookUid": event.target.parentNode.parentNode.firstChild.innerText
                            })
                            .then((result) => {
                                console.log(result);
                                this.EventBus.$emit('viewItem', result);
                            })
                            .catch(error => {
                                console.log('failed', error)
                            });
    
                    },
                    deleteItem: function (event) {
                        axios.post(`http://localhost:8109/yes25_project/products/ajax/delete.ajax`, {
                                "bookUid": event.target.parentNode.parentNode.firstChild.innerText
                            })
                            .then((result) => {
                                console.log(result);
                                this.EventBus.$emit('refresh', 'hello');
                            })
                            .catch(error => {
                                console.log('failed', error)
                            });
                    }
                },
    
            });
    
            let app3 = new Vue({
                el: '#viewBook',
                data: {
                    bookUid: '',
                    subject: '',
                    author: '',
                    price: '',
                    content: '',
                    pubdate: ''
                },
                created() {
                    this.EventBus.$on('viewItem', result => {
                        this.bookUid = result.data[0].bookUid;
                        this.subject = result.data[0].subject;
                        this.author = result.data[0].author;
                        this.price = result.data[0].price;
                        this.content = result.data[0].content;
                    });
                },
                methods: {
                    clearForm: function () {
                        this.subject = '';
                        this.author = '';
                        this.price = '';
                        this.content = '';
                    },
                    update: function () {
                        axios.post(`http://localhost:8109/yes25_project/products/ajax/update.ajax`, {
                                "bookUid": this.bookUid,
                                "subject": this.subject,
                                "author": this.author,
                                "price": this.price,
                                "content": this.content,
                                "pubdate": this.pubdate,
    
                            })
    
    
                            .then((result) => {
                                console.log(result);
                                this.EventBus.$emit('refresh', 'hello');
                                this.clearForm();
                            })
                            .catch(error => {
                                console.log('failed', error)
                            });
                    }
    
                }
            });
        </script>
    
    </body>
    
    </html>