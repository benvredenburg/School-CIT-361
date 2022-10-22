function greet {
    if($args.count){
        "Hello $args, how are you?"
    }else{
        'No one to say hello to.'
    }
}

function q1{$args}

function isodd($num){
    if($num %2 -eq 1){return $true}
    $false
}