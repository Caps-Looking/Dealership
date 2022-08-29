$("#vehicle_plate").mask('AAA-9999', {
    onKeyPress: (value, event) => {
        event.currentTarget.value = value.toUpperCase();
    }
});

