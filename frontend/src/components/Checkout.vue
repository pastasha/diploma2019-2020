<template>
    <div class="big-body" id="app">

        <div class="nav-item">
            <router-link to="/"> <img class="logo-link" src="@/assets/logo.png"> </router-link>
        </div>

        <div class="form-body">
            <h1>ОФОРМЛЕНИЕ ЗАКАЗА</h1>

            <div class="form-container">
                <form   id="checkout"
                        @submit="checkForm"
                        method="post"
                        novalidate="true">

                    <div class="error-container" v-if="errors.length">
                        <p>Эти поля обязательны к заполению:</p>
                        <ul>
                            <li v-for="error in errors" :key="error.id">  -{{ error }}</li>
                        </ul>
                    </div>

                    <div class="contact-details-container">
                        <p class="forms-title">Контактные данные</p>
                        <label>
                            <input class="form-input" v-model="postBody.full_name" placeholder="Имя и фамилия">
                        </label>
                        <label>
                            <input class="form-input" v-model="postBody.country" placeholder="Страна">
                        </label>
                        <label>
                            <input class="form-input" v-model="postBody.city" placeholder="Город">
                        </label>
                        <label>
                            <input class="form-input" v-model="postBody.telephone_number"
                                   placeholder="Телефонный номер">
                        </label>

                        <span>Хочу продолжать общение посредством</span>
                        <div id="keep_in_touch_id" class="keep_in_touch_form">
                            <label for="telegram">
                                <input class="form-radio" type="radio" id="telegram" value="t"
                                       v-model="postBody.keep_in_touch" checked>
                                <span class="design"></span>
                                <span>Telegram</span>
                            </label>

                            <label for="viber">
                                <input class="form-radio" type="radio" id="viber" value="v"
                                       v-model="postBody.keep_in_touch" checked>
                                <span class="design"></span>
                                <span>Viber</span>
                            </label>

                            <label for="telephone">
                                <input class="form-radio" type="radio" id="telephone" value="m"
                                       v-model="postBody.keep_in_touch" checked>
                                <span class="design"></span>
                                <span>Телефона</span>
                            </label>
                            <br>
                        </div>

                        <label v-if="postBody.keep_in_touch==='Telegram'">
                            <input class="form-input" v-model="postBody.nickname"
                                   placeholder="Никнейм аккаунта">
                        </label>
                    </div>

                    <div class="way_to_receive_the_package">
                        <p class="forms-title">Способ получения</p>
                        <span>Получить заказ в городе {{ postBody.city }}:</span>
                        <div id="receive_id" class="receive_form">
                            <label for="NewPost">
                                <input class="form-radio" type="radio" id="NewPost" value="n"
                                       v-model="postBody.receive" checked>
                                <span class="design"></span>
                                <span>самовывоз из Новой Почты</span>
                            </label>
                            <br>
                            <label for="UkrPost">
                                <input class="form-radio" type="radio" id="UkrPost" value="u"
                                       v-model="postBody.receive" checked>
                                <span class="design"></span>
                                <span>самовывоз из Укрпочты</span>
                            </label>
                            <br>
                            <label for="NewPostCourier">
                                <input class="form-radio" type="radio" id="NewPostCourier" value="c"
                                       v-model="postBody.receive" checked>
                                <span class="design"></span>
                                <span>курьер Новой Почты</span>
                            </label>
                            <br>
                            <label for="At the meeting">
                                <input class="form-radio" type="radio" id="At the meeting" value="m"
                                       v-model="postBody.receive" checked>
                                <span class="design"></span>
                                <span>при встрече (только в Одессе)</span>
                            </label>
                            <br>
                            <br>
                        </div>

                        <label>
                            <input class="form-input" v-model="postBody.post_office" placeholder="Почтовое отделение"
                                   v-if="postBody.receive === 'n' || postBody.receive === 'u'">
                        </label>

                        <label>
                            <input class="form-input" v-model="postBody.address" placeholder="Адрес"
                                   v-if="postBody.receive === 'c'">
                        </label>
                    </div>

                    <div class="payment_method">
                        <p class="forms-title">Способ оплаты</p>
                        <div id="payment" class="keep_in_touch_form">
                            <label for="upon receipt">
                                <input class="form-radio" type="radio" id="upon receipt" value="o"
                                       v-model="postBody.payment" checked>
                                <span class="design"></span>
                                <span>Оплатить заказ при получении</span>
                            </label>
                            <br>
                            <label for="transfer to card">
                                <input class="form-radio" type="radio" id="transfer to card" value="p"
                                       v-model="postBody.payment" checked>
                                <span class="design"></span>
                                <span>Перевод на карту</span>
                            </label>
                            <br>
                        </div>
                        <br>
                    </div>

                    <div class="c-comment">
                        <p class="forms-title">Комментарий</p>
                        <textarea class="c-input-text" v-model="postBody.comment" placeholder="Укажите дополнительную информацию"></textarea>
                        <br>
                    </div>
                    <button class="checkout-button" v-on:click="checkForm">ОФОРМИТЬ ЗАКАЗ</button>

                </form>
            </div>
            <div class="order">
                <figure>
                    <p><img class="preview-picture-form"
                            v-bind:src="require('@/assets/pics/preview/' + $route.params.preview)"
                            :alt="$route.params.preview"></p>
                    <figcaption>
                        {{postBody.picture_with_price_list = $route.params.title}}
                    </figcaption>
                    <button class="picture-state-form">{{ $route.params.price }}$</button>
                </figure>
            </div>
        </div>

        <div class="customModal" v-if="showModal === true">
            <div class="customModalBody">
                
                <img title="закрыть окно" v-on:click="showModal = false" class="close-link" src="@/assets/close-img.png">

                <h1>ПОДТВЕРЖДЕНИЕ</h1>

                <div class="buyer-information">
                    <p>Имя и фамилия:
                        <label>{{postBody.full_name}}</label>
                    </p>
                    <p>Страна:
                        <label>{{postBody.country}}</label>
                    </p>
                    <p>Город:
                        <label>{{postBody.city}}</label>
                    </p>
                    <p>Мобильный телефон:
                        <label>{{postBody.telephone_number}}</label>
                    </p>
                    <p>Продолжать общение посредством
                        <label v-if="postBody.keep_in_touch==='t'">Telegram</label>
                        <label v-if="postBody.keep_in_touch==='v'">Viber</label>
                        <label v-if="postBody.keep_in_touch==='m'">мобильного телефона</label>
                    </p>
                    <p v-if="$route.params.keep_in_touch==='Telegram'||$route.params.keep_in_touch==='Viber'">Никнейм {{$route.params.keep_in_touch}}:
                        <label>{{postBody.nickname}}</label>
                    </p>
                    <p>Получить заказ
                        <label v-if="postBody.receive==='n'">самовывоз из Новой Почты</label>
                        <label v-if="postBody.receive==='u'">самовывоз из Укрпочты</label>
                        <label v-if="postBody.receive==='c'">курьер Новой Почты</label>
                        <label v-if="postBody.receive==='m'">при встрече (только в Одессе)</label>
                    </p>

                    <p v-if="postBody.receive==='n' || postBody.receive==='u'">Отделение
                        <label>{{postBody.post_office}}</label>
                    </p>

                    <p v-if="postBody.receive==='c'">Адрес
                        <label>{{postBody.address}}</label>
                    </p>

                    <p>Способ оплаты
                        <label v-if="postBody.payment==='o'">оплатить заказ при получении</label>
                        <label v-if="postBody.payment==='p'">перевод на карту</label>
                    </p>
                    <br><br>
                    <small>Дата заказа:
                        <label>{{postBody.datetime}}</label>
                    </small>

                </div>

                <div class="bill">
                    <h1>ИТОГО</h1>
                    <p class="order-count"> 1 заказ </p>
                    <p><b>Стоимость доставки зависит от перевозчика.</b></p>
                    ______________________________
                    <p class="total_amount">Общая стоимость
                        <label class="label-bill">{{ postBody.total_amount = $route.params.price}}$</label>
                    </p>
                    _______________________________
                    <p class="mini-description">Мы свяжемся с вами посредством
                        <label v-if="postBody.keep_in_touch==='t'">Telegram</label>
                        <label v-if="postBody.keep_in_touch==='v'">Viber</label>
                        <label v-if="postBody.keep_in_touch==='m'">мобильного телефона</label>
                    в течении 2 дней.</p>
                    <button class="verification-button" v-on:click="postPost">ПОДТВЕРДИТЬ ЗАКАЗ</button>
                </div>

                <div class="result" v-if="showModal==='+'">
                    <p class="result-title">Благодарим!</p>
                    <p>А пока Ваш заказ в обработке предлагаем продолжить наслаждаться иссуством ;)</p>
                    <router-link to="/gallery">
                        <button class="full-picture-state">ПЕРЕЙТИ В ГАЛЕРЕЮ</button>
                    </router-link>
                </div>
            </div>
        </div>

        <SidePanel></SidePanel>
    </div>
</template>

<script>
    import SidePanel from "./SidePanel";
    import axios from "axios";

    let now = new Date();
    now = now.toString();
    export default {
        name: "Checkout",
        components: {SidePanel},
        data() {
            return {
                errors: [],
                showModal: false,
                showResult: "No",
                postBody: {
                    full_name: '',
                    country: '',
                    city: '',
                    telephone_number: '',
                    nickname: '',
                    keep_in_touch: '',
                    receive: '',
                    post_office: '',
                    address: '',
                    payment: '',
                    total_amount: '',
                    comment: '',
                    picture_with_price_list: '',
                    datetime: now.slice(3,21)
                }
            }
        },
        methods: {
            checkForm: function (e) {
                this.errors = [];
                if (!this.postBody.full_name) {
                    this.errors.push('имя и фамилия*');
                }
                if (!this.postBody.country) {
                    this.errors.push('страна*');
                }
                if (!this.postBody.city) {
                    this.errors.push('город*');
                }
                if (!this.postBody.telephone_number) {
                    this.errors.push('телефон*');
                }
                if (!this.postBody.keep_in_touch) {
                    this.errors.push('способ связи*');
                }
                if (!this.postBody.receive) {
                    this.errors.push('способ получения*');
                }
                if (!this.postBody.payment) {
                    this.errors.push('способ оплаты*');
                }
                if (!this.errors.length) {
                    this.showModal = true;
                } e.preventDefault();
            },
            postPost : function () {
                const str = JSON.stringify(this.postBody);
                this.showModal = '+';
                axios.post('http://localhost:8000/bot/order-form/', str);
            }
        }
    }
</script>

<style>
    .error-container{
        padding: 10px 40px;
        margin-bottom: 30px;
        background-color: #ffcad2;
        box-shadow: 0 0 10px rgba(180, 0, 0, 0.56);
    }

    .error-container p{
        margin: 0;
        font: 1.1em Yu Gothic UI;
        text-align: left;
        color: #707070;
    }

    .error-container ul{
        display: inline-block;
        margin: 0;
    }

    .error-container li{
        display: inline-block;
        margin: 0 150px 0 20px;
        font: bold 1em Yu Gothic UI;
        text-align: left;
        color: #707070;
    }

    .picture-state-form{
        background-color: #F1F1F1;
        height: 30px;
        width: 80%;
        margin-top: 10px;
        box-shadow: 0 0 6px #D1D1D1;
        padding: 0;
        border: none;
        font: 1em Yu Gothic UI;
        color: #707070;
    }

    figcaption{
        font: normal 1em Yu Gothic UI;
        margin-top: -20px;
        text-transform: uppercase;
        color: #707070;
    }

    figure{
        margin: 0;
        padding: 0;
        text-align: center;
    }

    .preview-picture-form{
        border: solid 10px white;
        margin: 0;
        width: 100%;
    }

    .order{
        position: absolute;
        top: 70px;
        right: 0;
        width: 30%;
        margin-left: 30px;
        margin-bottom: 30px;
        padding-bottom: 20px;
        background-color: white;
        box-shadow: 0 0 10px #D1D1D1;;
    }

    .checkout-button{
        position: relative;
        text-transform: uppercase;
        width: 100%;
        background-color: #ccfed9;
        height: 50px;
        margin-bottom: 60px;
        box-shadow: 0 3px 6px rgb(222, 222, 222);
        padding: 0;
        border: none;
        text-align: center;
        font: 1em Gothic UI;
        color: #7EBB97;
    }

    .c-comment{
        position: relative;
        margin-bottom: 30px;
        background-color: white;
        box-shadow: 0 0 10px #D1D1D1;
        left: 0;
        right: 0;
        padding: 5px 40px 15px;
    }

    .payment_method{
        margin-bottom: 30px;
        background-color: white;
        box-shadow: 0 0 10px #D1D1D1;
        left: 0;
        right: 0;
        padding: 5px 40px 15px;
        //border: solid chartreuse 1px;
    }

    .way_to_receive_the_package{
        margin-bottom: 30px;
        background-color: white;
        box-shadow: 0 0 10px #D1D1D1;
        left: 0;
        right: 0;
        padding: 5px 40px 15px;
        //border: solid aqua 1px;
    }

    .contact-details-container{
        margin-bottom: 30px;
        background-color: white;
        box-shadow: 0 0 10px #D1D1D1;
        left: 0;
        right: 0;
        padding: 5px 40px 15px;
        //border: solid navy 1px;
    }

    .form-container{
        position: relative;
        display: inline-block;
        top: 20%;
        width: 66%;
        left: 0;
        bottom: 0;
        z-index: 0;
    }

    .form-body{
        position: absolute;
        right: 20%;
        left: 20%;
        top: 100px;
        bottom: 50px;
    }

    .forms-title{
        font: lighter 2em Yu Gothic UI;
        text-align: center;
        color: #707070;
    }

    span{
        font: lighter 1em Yu Gothic UI;
        text-align: center;
        color: #707070;
        margin-right: 15px;
    }

    .customModal {
        box-shadow: 0 0 999px #727272;
        top: 15%;
        left: 25%;
        right: 20%;
        width: 700px;
        height: 500px;
        border-radius: 5px;
        background-color: white;
        position: fixed;
        overflow: hidden;
    }

    .customModalBody{
        position: absolute;
        top: 0;
        bottom: 0;
        left: 0;
        right: 0;
        padding: 20px 100px 20px 50px;
    }

    .bill p{
        font: 1em Yu Gothic UI;
        margin-bottom: 1px;
    }

    .bill h1{
        margin-bottom: 10px;
        font: 2em Yu Gothic;
    }

    .form-input{
        position: relative;
        width: 100%;
        height: 30px;
        background-color: white;
        box-shadow: 0 0 6px #D1D1D1;
        border: none;
        margin-top: 20px;
        margin-bottom: 15px;
        font: 13pt Yu Gothic UI;
        color: #302f38;
    }

    .c-input-text{
        position: relative;
        background-color: white;
        box-shadow: 0 0 6px #D1D1D1;
        margin-top: 20px;
        width: 100%; /* Ширина поля в процентах */
        height: 180px; /* Высота поля в пикселах */
        resize: none;
        font: 13pt Yu Gothic UI;
        color: #302f38;
        margin-bottom: 30px;
    }
</style>