#====================================================================
#
#         Winim - Windows API, COM, and .NET Binding for Nim
#                   Copyright (c) Chen Kai-Hung
#
#====================================================================

## A small WPF example hosted by modern CoreCLR. The window is created from
## XAML through `PresentationFramework`; no C# project or .NET SDK is needed.

import winim/dotnet

const xaml = """
  <Window
         xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
         xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
         Title="Nim + modern .NET WPF" Height="300" Width="420"
         WindowStartupLocation="CenterScreen">
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
          <Label Content="Left" Grid.Column="0" Background="LightBlue"
                 HorizontalContentAlignment="Center"
                 VerticalContentAlignment="Center" />
          <GridSplitter VerticalAlignment="Stretch"
                        HorizontalAlignment="Stretch"
                        Grid.Column="1" Width="5" Grid.RowSpan="3" />
          <Label Content="Right" Grid.Column="2" Grid.Row="2"
                 Background="LightBlue"
                 HorizontalContentAlignment="Center"
                 VerticalContentAlignment="Center" />
          <Label Content="Top" Grid.Column="2" Background="LightGreen"
                 HorizontalContentAlignment="Center"
                 VerticalContentAlignment="Center" />
          <GridSplitter HorizontalAlignment="Stretch"
                        VerticalAlignment="Stretch"
                        Grid.Row="1" Height="5" Grid.ColumnSpan="3" />
          <Label Content="Bottom" Grid.Column="0" Grid.Row="2"
                 Background="LightGreen"
                 HorizontalContentAlignment="Center"
                 VerticalContentAlignment="Center" />
      </Grid>
  </Window>
  """

proc main() =
  dotnetStart(frameworkName = "Microsoft.WindowsDesktop.App")
  defer: dotnetClose()

  let wpf = load("PresentationFramework")
  let xamlReader = wpf.getType("System.Windows.Markup.XamlReader")
  let application = wpf.new("System.Windows.Application")
  let window = xamlReader.Parse(xaml)

  application.Run(window)

when isMainModule:
  main()
