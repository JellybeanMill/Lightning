
void setup()
{
  size(1000,600);
}
void draw()
{
	slope(lineMeasureMouseX(mouseX),lineMeasureMouseX(mouseY));
	ellipse(500,300,100,100);
}
int lineMeasureMouseX (int mouseofX)
{
	int comparedMouseX = mouseofX - 500;
	comparedMouseX = (int)(absoluteVaule(comparedMouseX));
	return comparedMouseX;
}
int lineMeasureMouseY (int mouseofY)
{
	int comparedMouseY = mouseofY - 300;
	comparedMouseY = (int)(absoluteVaule(comparedMouseY));
	return comparedMouseY;
}
int slope(int deltaX, int deltaY)
{
	int finalDelta;
	finalDelta = (int)(sqrt(sq(deltaX)+sq(deltaY)));
	return finalDelta;
}
double absoluteVaule (double num)
{
	if (num < 0)
	{
		num = num * -1;
	}
	return num;
}
void mousePressed()
{

}

