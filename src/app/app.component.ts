import { Component } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterOutlet } from '@angular/router';
import { environment } from '../environments/environment';
import { version } from '../version'; // Assuming version.ts is in the src directory

@Component({
  selector: 'app-root',
  standalone: true,
  imports: [CommonModule, RouterOutlet],
  templateUrl: './app.component.html',
  styleUrl: './app.component.scss'
})
export class AppComponent {
  title = 'bhs-frontend - ' + environment.envName;
  backendUrl = environment.backendUrl;
  buildTime = version.buildTime; // Accessing the version from version.ts
  commitHash = version.commitHash; // Accessing the version from version.ts 
}
