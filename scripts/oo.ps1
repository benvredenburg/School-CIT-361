enum colors{
    red = 0;
    blue = 1;
    green = 2
}

Class Circle {
    static $Pi=3.1415927
    [double]$Diameter
    [colors]$color

    Circle(){}
    Circle([double]$Diameter, $color) {
        # Store the value passed to the constructor in the property
        $this.Diameter=$Diameter
        $this.color=$color
    }
    
    static[double]Area([double]$Diameter) {
        return [Circle]::Pi * [math]::pow($Diameter/2,2)
    }
    static[double]Circumference([double]$Diameter) {
        return [Circle]::Pi * $Diameter
    }
    [double]Area() {
        return [Circle]::Area($this.Diameter)
    }
}

Class Column:Circle {
    [double]$Height

    Column([double]$Diameter,[double]$Height) {
        #when I tried ':base($Diameter)' above like in the example,
        #it through an error "Cannot find an overload for "new" 
        #and the argument count: "1"."
        $this.Diameter=$Diameter
        $this.Height=$Height
    }
    static [double]Volume([double]$Diameter,[double]$Height) {
        return [Circle]::Area($Diameter) * $Height
    }
    [double]Volume() {
        return $this.Area() * $this.Height
    }
}