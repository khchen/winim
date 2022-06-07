#====================================================================
#
#               Winim - Nim's Windows API Module
#                 (c) Copyright 2016-2022 Ward
#
#====================================================================

# Source: https://github.com/pythonnet/pythonnet/blob/master/demo/DynamicGrid.py

import winim/clr

const xaml = """
  <Window
         xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
         xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
         Title="WpfApplication1" Height="300" Width="300">
      <Grid>
          <Grid.RowDefinitions>
              <RowDefinition Height="*"/>
              <RowDefinition Height="Auto"/>
              <RowDefinition Height="*"/>
          </Grid.RowDefinitions>
          <Grid.ColumnDefinitions>
              <ColumnDefinition Width="*"/>
              <ColumnDefinition Width="Auto"/>
              <ColumnDefinition Width="*"/>
          </Grid.ColumnDefinitions>
          <Label Content="Left" Grid.Column="0" Background="LightBlue" />
          <GridSplitter
                      VerticalAlignment="Stretch"
                      HorizontalAlignment="Stretch"
                      Grid.Column="1"
                      Width="5"
                      Grid.RowSpan="3"/>
          <Label Content="Right" Grid.Column="2" Grid.Row="2" Background="LightBlue" />
          <Label Content="Top" Grid.Column="2" Background="LightGreen"/>
          <GridSplitter
                      HorizontalAlignment="Stretch"
                      VerticalAlignment="Stretch"
                      Grid.Row="1"
                      Width="Auto"
                      Height="5"
                      Grid.ColumnSpan="3"/>
          <Label Content="Bottom" Grid.Column="0" Grid.Row="2" Background="LightGreen" />
      </Grid>
  </Window>
  """

let
  mscor = load("mscorlib")
  io = load("System.IO")
  wpf = load("PresentationFramework")

  Encoding = mscor.GetType("System.Text.Encoding")
  MemoryStream = io.GetType("System.IO.MemoryStream")
  XamlReader = wpf.GetType("System.Windows.Markup.XamlReader")
  Application = wpf.GetType("System.Windows.Application")

  byteArray = @Encoding.UTF8.GetBytes(xaml)
  stream = @MemoryStream.new(byteArray)
  xamlReader = @XamlReader.new()
  application = @Application.new()
  window = xamlReader.Load(stream)

application.Run(window)
