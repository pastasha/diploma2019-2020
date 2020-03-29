<template>
    <div class="big-body" id="app">

        <div class="nav-item">
            <router-link to="/"> <img class="logo-link" src="@/assets/logo.png"> </router-link>
        </div>

        <div class="verification-body">
            <h1>ПОДТВЕРЖДЕНИЕ</h1>
            <div id="buyer-and-bill-container" class="buyer-information-and-bill-container">
                <router-link to="../" class="ver-links" title="редактировать заказ">
                    <img class="back-link" src="@/assets/arrow-right.png">
                </router-link>
                <router-link to="/gallery" class="ver-links" title="отменить заказ">
                    <img class="close-link" src="@/assets/close-img.png">
                </router-link>
                <div class="buyer-information"  v-if="showResult === 'No'">
                    <p>Имя и фамилия:
                        <label>{{postBody.full_name = $route.params.full_name}}</label>
                    </p>
                    <p>Страна:
                        <label>{{postBody.country = $route.params.country}}</label>
                    </p>
                    <p>Город:
                        <label>{{postBody.city = $route.params.city}}</label>
                    </p>
                    <p>Мобильный телефон:
                        <label>{{postBody.telephone_number = $route.params.telephone_number}}</label>
                    </p>
                    <p>Хочу продолжать общение посредством
                        <label>{{postBody.keep_in_touch = $route.params.keep_in_touch}}</label>
                    </p>
                    <p v-if="$route.params.keep_in_touch==='Telegram'||$route.params.keep_in_touch==='Viber'">Никнейм {{$route.params.keep_in_touch}}:
                        <label>{{postBody.nickname = $route.params.nickname}}</label>
                    </p>
                    <p>Получить заказ
                        <label>{{postBody.receive = $route.params.receive}}</label>
                    </p>
                    <p>Способ оплаты
                        <label>{{postBody.payment = $route.params.payment}}</label>
                    </p>
                    <div class="hover-it">
                        {{postBody.picture = $route.params.picture}}
                        {{postBody.comment = $route.params.comment}}
                        {{postBody.total_amount = $route.params.total_amount}}
                    </div>
                    <br><br>
                    <p>Дата заказа:
                        <label>{{postBody.datetime}}</label>
                    </p>

                </div>

                <div class="bill"  v-if="showResult === 'No'">
                    <p class="itogo">ИТОГО</p>
                    <p class="order-count"> 1 заказ </p>
                    <p class="second-price"><b>Стоимость доставки зависит от перевозчика.</b></p>
                    ______________________________
                    <p class="total_amount">Общая стоимость
                        <label class="label-bill">{{$route.params.total_amount}}$</label>
                    </p>
                    _______________________________

                    <div class="mini-description">Мы свяжемся с вами посредством {{postBody.keep_in_touch}} в течении 2 дней.</div>
                    <button class="verification-button" v-on:click="postPost" s>ПОДТВЕРДИТЬ ЗАКАЗ</button>
                </div>

                <div class="result"  v-if="showResult === 'Yes'">
                    <p class="result-title">Безмерно Вас благодарим!</p>
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

<script language="JavaScript" type="text/javascript">
    import axios from 'axios';
    import SidePanel from "./SidePanel";

    let now = new Date();
    now = now.toString();
    export default {
        name: "Verification",
        components: {SidePanel},
        data() {
            return {
                ishover: 'No',
                showResult: 'No',
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
            postPost : function () {
                const str = JSON.stringify(this.postBody);
                this.showResult = 'Yes';
                axios.post('http://localhost:8000/bot/order-form/', str);
            }
        }
    }
</script>

<style>
    .result-title{
        text-transform: uppercase;
        font: 20pt Yu Gothic;
    }

    .result{
        margin-top: 120px;
        text-align: center;
    }

    .hover-it{
        opacity: 0;
    }

    .second-price{
        margin: 0;
    }

    .order-count{
        margin-bottom: 5px;
    }

    .total_amount{
        margin-top: 10px;
        margin-bottom: 5px;
    }

    .back-link{
        position: absolute;
        left: 5px;
        top: 10px;
        width: 40px;
        opacity: 60%;
    }

    .close-link{
        position: absolute;
        right: 10px;
        top: 10px;
        width: 30px;
        opacity: 50%;
    }

    hr{
        margin-bottom: 20px;
        margin-top: 20px;
    }

    .mini-description{
        font: 13pt Yu Gothic UI;
        text-align: center;
        color: #9b9b9b;
        margin-top: 10px;
        margin-bottom: 30px;
    }

    .itogo{
        text-align: center;
        font: lighter 20pt Yu Gothic;
    }

    .verification-button{
        width: 85%;
        left: 20px;
        background-color: #ccfed9;
        height: 50px;
        margin-bottom: 60px;
        box-shadow: 0 3px 6px rgb(222, 222, 222);
        padding: 0;
        border: none;
        text-align: center;
        font: 15pt Yu Gothic UI;
        color: #7EBB97;
    }

    .bill{
        text-align: center;
        position: relative;
        display: inline-block;
        top: 0;
        width: 34%;
        height: 100%;
        margin: 0;
        padding: 20px 10px;
        background-color: #F5F5F5;
        box-shadow: 0 0 10px #D1D1D1;
    }

    label{
        font: bold 15pt Yu Gothic UI;
    }

    p{
        margin-bottom: 16px;
    }

    .buyer-information{
        position: relative;
        display: inline-block;
        top: 5%;
        left: 0;
        height: 100%;
        width: 55%;
        margin-right: 50px;
    }

    .buyer-information-and-bill-container{
        position: absolute;
        top: 140px;
        left: 0;
        right: 0;
        bottom: 0;
        padding: 50px;
        box-shadow: 0 0 10px #D1D1D1;
    }

    .verification-body{
        position: absolute;
        right: 400px;
        left: 300px;
        top: 100px;
        bottom: 100px;
    }
</style>