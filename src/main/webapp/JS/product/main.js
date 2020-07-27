/**
 * 
 */
let app = new Vue({
    el: '#app',
    data: {
        posts: [],
        file: null,
        url: '',
        subject: '',
        author: '',
        price: '',
        content: '',
        categoryUid: '',
        pubUid: '',
    },
    created() {
        this.getList();
    },
    methods: {
        getList: function () {
            axios.get(`http://localhost:8109/yes25_project/products/ajax/list.ajax`, {
                    "page": 1
                })
                .then((result) => {
                    console.log('리스트 가져오기 성공')
                    console.log(result);
                    console.log(result.data.data);

                    this.posts = result.data.data;
                })
                .catch(error => {
                    console.log('리스트 가져오기 실패', error)
                });

        },
        clearForm: function () {
            this.subject = '';
            this.author = '';
            this.price = '';
            this.content = '';
            this.categoryUid = '';
            this.pubUid = '';
            this.url = '';
            this.file = null;
            this.$refs.myFileInput.value = '';
        },
        onFileChange(e) {
            const file = e.target.files[0];
            console.log(file);
            this.file = file;
            this.url = URL.createObjectURL(file);
        },
        onDrop(e) {
            const file = e.dataTransfer.files[0];
            this.file = file;
            this.url = URL.createObjectURL(file);
        },
        imageUpload(bookUid) {
            let formData = new FormData();
            formData.append('file', this.file);
            formData.append('bookuid', bookUid);

            axios.post('http://localhost:8109/yes25_project/products/ajax/upload.ajax',
                formData, {
                    headers: {
                        'Content-Type': 'multipart/form-data'
                    }
                }).then(function () {
                console.log('사진 업로드 성공!!');
                // this.getList();

            }).catch(function () {
                console.log('사진 업로드 실패!!');
            });

        },
        submitForm: function () {
            axios.post(`http://localhost:8109/yes25_project/products/ajax/insert.ajax`, {
                    "subject": this.subject,
                    "author": this.author,
                    "price": this.price,
                    "content": this.content,
                    "categoryUid": this.categoryUid,
                    "pubUid": this.pubUid,
                })
                .then((result) => {
                    console.log("폼 서밋 완료");
                    const bookUid = result.data;
                    if (this.file != null) {
                        this.imageUpload(bookUid);                        
                    } 
                    setTimeout(() => {
                        this.getList();
                      }, 100);
                    
                    this.clearForm();

                })
                .catch(error => {
                    console.log('failed', error)
                });

        },
        maxLengthCheck: function (event) {
            const value = event.target.value;
            console.log(value, this.price);
            if (String(value).length > 7) {
                this.price = String(value).slice(0, 7);
            }

        },
        viewItem: function (event) {
            axios.post(`http://localhost:8109/yes25_project/products/ajax/view.ajax`, {
                    "bookUid": event.target.parentNode.parentNode.firstChild.innerText
                })
                .then((result) => {
                    console.log(result);
                })
                .catch(error => {
                    console.log('failed', error)
                });

        },
        deleteItem: function (event) {
            console.log(event.target.parentNode.parentNode.firstChild.innerText);

            axios.post(`http://localhost:8109/yes25_project/products/ajax/delete.ajax`, {
                    "bookUid": event.target.parentNode.parentNode.firstChild.innerText
                })
                .then((result) => {
                    console.log(result);
                    this.getList();
                })
                .catch(error => {
                    console.log('failed', error)
                });
        }
    },

});