$(document).ready(function() {

    money = Number($('#cur_money').html())
    weight = Number($('#cur_weight').html())

    $('td.quantity input').click(function() {
        update_money()
    })

	$('td.quantity input').change(function() {
        update_money()
    })

	$('td.quantity input').keyup(function() {
        update_money()
    })

})

function update_money() {

    var new_money = money
    var new_weight = weight

    $('td.quantity input').each(function() {

        var quantity = $(this).val()
        var weight = $(this).parent().parent().find('.weight label').first().html()
        var price = $(this).parent().parent().find('.value label').first().html()

        quantity = Number(quantity)
        weight = Number(weight)
        price = Number(price)

        new_money = new_money - (price * quantity)
        new_weight = new_weight - (weight * quantity)

    })

    $('#cur_money').html(new_money)
    $('#cur_weight').html(new_weight)

    $('#traveling_party_money').val(new_money)
    $('#traveling_party_capacity').val(new_weight)

    if (new_money < 0 || new_weight < 0) {
        disable()
    } else {
        enable()
    }

}

function disable() {
    $('#move-on').hide()
}

function enable() {
    $('#move-on').show()
}
