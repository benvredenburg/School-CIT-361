Class Circle {
    static $Pi=3.1415927
    [double]$Diameter
    $color

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